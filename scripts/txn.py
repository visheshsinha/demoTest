from brownie import demoTest
from scripts.funcs import get_account

def pay():
    demo_test = demoTest[-1]
    account = get_account()
    payment = demo_test.getAmount()
    print(f"The Final Payment  is {payment}")
    demo_test.paymentFinal({"from": account, "value": payment})

def withdraw():
    demo_test = demoTest[-1]
    account = get_account()
    demo_test.withdraw({"from": account})

def main():
    choice = input("Enter P: Pay \nEnter W: Withdraw \nChoice: ")
    if choice is "P":
        pay()
    else:
        if choice is "W":
            withdraw()
        else:
            print("\nWrong Choice")