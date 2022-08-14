from brownie import FundMe, network, config
from scripts.helpful_scripts import get_account


def deploy_fund_me():
    account = get_account()
    # default network is rinkeby fork, so there is alway priceFeed contract, no need mocking
    price_feed_address = config["networks"][network.show_active()]["eth_usd_price_feed"]

    fund_me = FundMe.deploy(
        price_feed_address,
        {"from": account},
        publish_source=config["networks"][network.show_active()].get("verify"),
    )
    print(f"Contract deployed to {fund_me.address}")
    print(f"ETH price: {fund_me.getPrice()/1e18} USD")

    eth_amount = 0.5 * 1e18
    print(
        f"Conversion rate: 0.5 ETH = {fund_me.getConversionRate(eth_amount)/1e18} USD"
    )
    return fund_me


def main():
    deploy_fund_me()
