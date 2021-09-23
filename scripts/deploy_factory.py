from brownie import accountFactory, network, config, accounts
from scripts.funcs import get_account

def deploy_accountFactory():
    account = get_account()

    account_factory = accountFactory.deploy(
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )

    return account_factory

def main():
    print(f"Contract created at {deploy_accountFactory()}")