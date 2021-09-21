// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract accountFactory {
    address[] public deployedAccounts;

    function createAccount() public {
        address newAccount = address(new demoTest(msg.sender));
        deployedAccounts.push(newAccount);
    }

    function getDeployedAccounts() public view returns (address[] memory) {
        return deployedAccounts;
    }
}

contract demoTest {
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountCustomers;
    address[] public customers;
    address public owner;
    AggregatorV3Interface public priceFeed;

    constructor(address creator) public {
        owner = creator;
        priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
    }

    function paymentFinal() public payable {
        uint256 floorVal = 5 * 1e18;
        require(getConversionRate(msg.value) >= floorVal);
        addressToAmountCustomers[msg.sender] += msg.value;
        customers.push(msg.sender);
    }

    function getPriceFeed() public view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount)
        public
        view
        returns (uint256)
    {
        uint256 ethPrice = getPriceFeed();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18; // wei
        return ethAmountInUSD;
    }

    function getAmount() public view returns (uint256) {
        uint256 floorVal = 50 * 1e18;
        uint256 price = getPriceFeed();
        uint256 precision = 1 * 1e18;
        return (floorVal * precision) / price;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw() public payable onlyOwner {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
}
