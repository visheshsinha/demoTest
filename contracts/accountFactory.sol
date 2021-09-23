// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;
import "./demoTest.sol";

contract accountFactory {
    
    using SafeMathChainlink for uint256;
    address[] public deployedAccounts;

    function createAccount() public {
        demoTest newAccount = new demoTest(msg.sender);
        deployedAccounts.push(address(newAccount));
    }

    function getDeployedAccounts() public view returns (address[] memory) {
        return deployedAccounts;
    }

    function addAccount(address _account) public{
        deployedAccounts.push(_account);
    }
    
}