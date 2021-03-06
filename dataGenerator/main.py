from functools import reduce
import random
import pandas as pd
import names
import faker
from faker import Faker
import datetime

number_of_instances = {"costumers": 5000, "car": 5000, "pricing": 3, "extras": 4}

cancellation_percentage = 0.1

f = Faker()


cause_list = ["the ac is not good enough for Israel in the summer", "it costs too much for us to justify it",
              "an unexpected event happened to my seventh child", "because",
              "I am very disappointed  because a medieval knight didn't attack me and I feel rejected",
              "the bride decided to run", "I became addicted to fantasy books so I don't want to drive any more",
              "my kids are annoying", "my grandparents bought me a new car", "I moved to the competitor",
              "I killed my wife and I should go to jail", "I moved to Canada, It's too hot here in Israel",
              "I had an unpleasant experience with the company", "I was too happy to drive",
              "a medieval knight attacked me with an axe and I am now mortally wounded"]


def main():

    print("starting")

    extras = pd.DataFrame(
        {"extra_id": [0, 1, 2, 3], "description": ["tablet", "booster_chair", "multimedia_system", "charger"],
         "price": [20, 10, 50, 5], "chance": [0.4, 0.1, 0.2, 0.5]})

    pricing = pd.DataFrame({
        "pricing_id": [0, 1, 2], "name": ["regular", "new_driver", "summer"], "price": [150, 200, 300]
    })

    orders = pd.DataFrame(
        {"order_id": [], "start_date": [], "end_date": [], "car_id": [],
         "costumer_id": [], "pricing_id": [], "payments": [], "sum_per_payment": []})

    extras_for_orders = pd.DataFrame(
        {"order_id": [], "extra_id": []}
    )

    num_orders = 0
    for i in range(number_of_instances["car"]):
        last_date = datetime.date.today() - datetime.timedelta(days=90)

        j = 0
        while last_date < datetime.date.today():
            j += 1
            new_days = random.randint(1, 10)
            start_date = last_date + datetime.timedelta(days=random.randint(3, 30))
            end_date = start_date + datetime.timedelta(days=new_days)

            payments_num = random.randint(1, 10)
            pricing_num = random.randint(0, number_of_instances["pricing"] - 1)
            payment_sum = pricing["price"][pricing_num] * new_days

            for index, extra in extras.iterrows():
                if random.random() < extra["chance"]:  # if this order was canceled
                    df2 = pd.DataFrame({"order_id": [num_orders + j], "extra_id": [extra["extra_id"]]})
                    extras_for_orders = pd.concat([extras_for_orders, df2], ignore_index=True, axis=0)
                    payment_sum += extra["price"]

            df2 = pd.DataFrame(
                {"order_id": [num_orders + j], "start_date": [start_date], "end_date": [end_date], "car_id": [i],
                 "costumer_id": [random.randint(0, number_of_instances["costumers"])],
                 "pricing_id": [pricing_num],
                 "payments": [payments_num], "sum_per_payment": [payment_sum/payments_num]})

            orders = pd.concat([orders, df2], ignore_index=True, axis=0)

            last_date = end_date

        num_orders = num_orders + j

# *********************************************************************************************************************************************
    cancellation = pd.DataFrame(
        {"cancellation_id": [], "cancellation_date": [], "cause": [], "order_id": []})
    num_cancellation = 0

    for index, order in orders.iterrows():

        if random.random() < cancellation_percentage:  # if this order was canceled
            cancellation_date = f.date_between_dates(order["start_date"] - datetime.timedelta(days=7),
                                                     order["start_date"])

            df2 = pd.DataFrame(
                {"cancellation_id": [num_cancellation], "cancellation_date": [cancellation_date],
                 "order_id": [order['order_id']],  "cause": [cause_list[random.randint(0, len(cause_list)) - 1]]})
            cancellation = pd.concat([cancellation, df2], ignore_index=True, axis=0)
            num_cancellation = num_cancellation + 1
# **************************************************************************************************************

    payments = pd.DataFrame(
        {"payment_id": [], "payment_month": [], "order_id": [], "sum": []})  # ToDo erase sum
    num_payments = 0

    for index, order in orders.iterrows():
        current_month = order["start_date"].month + 1
        for _ in range(int(order["payments"])):
            if current_month > datetime.datetime.now().month:
                break
            df2 = pd.DataFrame(
                {"payment_id": [num_payments], "payment_month": [current_month],
                 "order_id": [order['order_id']],  "sum": [order["sum_per_payment"]]})
            payments = pd.concat([payments, df2], ignore_index=True, axis=0)
            num_payments += 1
            current_month += 1

    costumers = pd.DataFrame(
        {"costumer_id": [i for i in range(number_of_instances["costumers"] + 1)]})

    cars = pd.DataFrame(
        {"car_id": [i for i in range(number_of_instances["car"] + 1)]})

    orders.drop("sum_per_payment", inplace=True, axis=1)
    extras.drop("chance", inplace=True, axis=1)

    orders.to_csv("orders.csv", index=False)
    cancellation.to_csv("cancellations.csv", index=False)
    payments.to_csv("payments.csv", index=False)
    extras.to_csv("extras.csv", index=False)
    pricing.to_csv("pricing.csv", index=False)
    extras_for_orders.to_csv("extras_for_orders.csv", index=False)
    costumers.to_csv("costumers.csv", index=False)
    cars.to_csv("cars.csv", index=False)


if __name__ == "__main__":
    main()

