from brownie import accounts, config, SimpleStorage
from brownie.network import gas_price
from brownie.network.gas.strategies import LinearScalingStrategy

def deploy_simple_storage():
    account = accounts[0]

    gas_strategy = LinearScalingStrategy("10 gwei", "70 gwei", 1.1)

    gas_price(gas_strategy)

    simple_storage = SimpleStorage.deploy({'from': account, 'gas_price': gas_strategy})


    print(simple_storage)


def main():
    deploy_simple_storage()