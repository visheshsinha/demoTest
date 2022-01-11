# Decentralhacks 2021 :computer:

<p align="center">
  <h2 align="center">Team Pegasas</h2>
</p>

Website Live at : [PEGASAS POS](https://pos-api-dh.herokuapp.com/)  
[Github Repo for Live Deployment](https://github.com/gitanshwadhwa28/POS-API)  :octocat:    
[Devfolio Project Write-Up](https://devfolio.co/submissions/pegasas-payment-gateway-63fa) :computer:

## Payment Track SmartContract

This is a repo in which we have designed the smartcontract in solidity to work on the PaymentTrack Theme in DecentralHacks [Octaloops] Hackathon (20th Sept - 1st Oct).

### Payment Track (Theme & Idea)

Nowadays many business small or big has started accepting UPI Payments , in future as crypto starts to be more accepted we might see businesses & e-commerce websites start accepting Crypto as a form of payment on any purchase.

What we are thinking  is that, we can write a smartcontract to take crypto payments equivalent to the listed price. Let's say if a product is listed for a certain amount in FIAT and the customer wants to pay in Crypto, as he goes to checkout , the latest-pricefeed of the selected cryptocurrency will be shown , Like if Listed Price is 300$ & the customer is paying using ETH Token & ETH/USD -> 3000$, he'll be shown the 0.1ETH + the Gas Fess as the Final Amount (we will be using Chainlink AggregatorV3Interface for getting the Pricefeeds), after which he can connect his Metamask & Pay.

#### TechStack

We used Brownie (Python Development Framework for Ethereum) to deploy and test our smartcontracts on Ganache CLI, Testnets & Mainnet-Forks.

We designed out smartcontract in Solidity Language. 

#### SmartContract Design 

[Account Factory](https://github.com/visheshsinha/demoTest/blob/master/contracts/accountFactory.sol) smartcontract is for keeping a tract of all the accounts which are using the Payment Track and creating accounts & deploying smartcontract for payment which is written seperately in [Account Demo Test](https://github.com/visheshsinha/demoTest/blob/master/contracts/demoTest.sol) smartcontract.

We are using Chainlink Oracle's [AggregatorV3 Interface](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol) which has  for fetching life price feeds from market for a particular `CRYPTO/FIAT` or a `CRYPTO/CRYPTO` pair. 

Payment Function can be called by anyone over the network but the assets in the smartcontracts can only be withdrawn by the creator/owner of the smartcontract (i.e, who deployed it).

#### Testing

Deployment and all the functions were tested using [Brownie](https://eth-brownie.readthedocs.io/en/stable/) on Ganache CLI & Rinkeby Testnet and are working properly. 


## Application Screenshots

![s1](https://github.com/gitanshwadhwa28/POS-API/blob/main/readme-screenshots/s1.png?raw=true)
![s2](https://github.com/gitanshwadhwa28/POS-API/blob/main/readme-screenshots/s2.png?raw=true)
![s3](https://github.com/gitanshwadhwa28/POS-API/blob/main/readme-screenshots/s3.png?raw=true)
![s4](https://github.com/gitanshwadhwa28/POS-API/blob/main/readme-screenshots/s4.png?raw=true)
![s5](https://github.com/gitanshwadhwa28/POS-API/blob/main/readme-screenshots/s5.png?raw=true)
