from brownie import accountFactory
from scripts.funcs import get_account
from scripts.deploy import deploy_demoTest


def create_accounts():
    deploy_demoTest()


def deployedAccount():
    print(accountFactory[-1].getDeployedAccounts())

def main():
    choice = input("Enter C: Create Account \nEnter D: getDeployedAccounts \nChoice: ")
    if choice is "C":
        print("Creating Account... ")
        create_accounts()
    else:
        if choice is "D":
            print("Deployed Accounts: ")
            deployedAccount()