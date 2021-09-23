from brownie import accountFactory, demoTest, network, config, accounts
from scripts.funcs import get_account

def deploy_demoTest():
    account = get_account()

    priceFeed_address = config["networks"][network.show_active()][
        "eth_usd_price_feed"
    ]

    demo_test = demoTest.deploy(
        priceFeed_address,
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )
    
    account_factory = accountFactory[-1]
    account_factory.addAccount(demo_test, {"from": account})

    return demo_test

def main():
    print(f"Contract created at {deploy_demoTest()}")