from functools import reduce
import random
import pandas as pd
import names
import faker
from faker import Faker
import datetime

number_of_instances = {"costumers": 20000, "car": 20, "pricing": 10, "extras": 10,
                       "orders": 50000, "cancellations": 5000}

cancellation_percentage = 0.2

f = Faker()


def main():

    print("starting")
    orders = pd.DataFrame(
        {"order_id": [], "start_date": [], "end_date": [], "car_id": [],
         "costumer_id": [], "pricing_id": [], "payments": [], "sum_per_payment": []})

    extras_for_orders = pd.DaraFrame(
        {"order_id": [], "extras_id": []}
    )

    num_orders = 0
    for i in range(number_of_instances["car"]):
        last_date = datetime.date.today() - datetime.timedelta(days=120)
        orders_car = random.randint(3, 10)

        for j in range(orders_car):
            start_date = last_date + datetime.timedelta(days=random.randint(2, 7))
            end_date = start_date + datetime.timedelta(days=random.randint(1, 9))

            df2 = pd.DataFrame(
                {"order_id": [num_orders + j], "start_date": [start_date], "end_date": [end_date], "car_id": [i],
                 "costumer_id": [random.randint(0, number_of_instances["costumers"])],
                 "pricing_id": [random.randint(0, number_of_instances["pricing"])],
                 "payments": [random.randint(1, 5)], "sum_per_payment": []})
            orders = pd.concat([orders, df2], ignore_index=True, axis=0)

            last_date = end_date

        num_orders = num_orders + orders_car
    orders.to_csv("orders.csv", index=False)

# *********************************************************************************************************************************************
    cancellation = pd.DataFrame(
        {"cancellation_id": [], "cancellation_date": [], "cause": [], "order_id": []})
    num_cancellation = 0

    for index, order in orders.iterrows():

        if random.random() < cancellation_percentage:  # if this order was canceled
            cancellation_date = f.date_between_dates(order["start_date"], order["end_date"])

            df2 = pd.DataFrame(
                {"cancellation_id": [num_cancellation], "cancellation_date": [cancellation_date],
                 "order_id": [order['order_id']],  "cause": [""]})
            cancellation = pd.concat([cancellation, df2], ignore_index=True, axis=0)
            num_cancellation = num_cancellation + 1

    cancellation.to_csv("cancellations.csv", index=False)

# **************************************************************************************************************

    payments = pd.DataFrame(
        {"payment_id": [], "payment_month": [], "order_id": [], "sum": []})
    num_payments = 0

    for index, order in orders.iterrows():
        current_month = order["start_date"].month + 1
        for _ in range(int(order["payments"])):
            if current_month > datetime.datetime.now().month:
                break
            df2 = pd.DataFrame(
                {"payment_id": [num_payments], "payment_month": [current_month],
                 "order_id": [order['order_id']],  "sum": [3]})
            payments = pd.concat([payments, df2], ignore_index=True, axis=0)
            num_payments += 1
            current_month += 1

    payments.to_csv("payments.csv", index=False)


if __name__ == "__main__":
    main()
