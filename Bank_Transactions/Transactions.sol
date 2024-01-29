// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "./Ownable.sol";

contract Transactions is Ownable {
    mapping(address => uint) internal balances;
    mapping(address => address) internal allowers;
    mapping(address => uint) internal allowance;

    modifier sufficientFunds(uint _amount) {
        require(balances[msg.sender] >= _amount, "Insufficient funds!");
        _;
    }

    modifier sufficientAllowance(address _allower, address _beneficiary, uint _amount) {
        require(allowers[msg.sender] == _allower, "Specified allower not found!");
        require(allowance[allowers[_beneficiary]] >= _amount, "Insufficient allowance available!");
        _;
    }

    modifier paymentFee() {
        require(msg.value == 0.05 ether, "You need to pay 0.05 ether to perform the funds transfer!");
        _;
    }

    function withdrawBalance(uint _amount) sufficientFunds(_amount) external {
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function transferBalance(address _recipient, uint _amount) paymentFee payable sufficientFunds(_amount) external {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }

    function depositBalance() payable external {
        balances[msg.sender] += msg.value;
    }

    function addAllowanceBalance(address _beneficiary, uint _amount) sufficientFunds(_amount) external {
        allowers[_beneficiary] = msg.sender;
        allowance[msg.sender] += _amount;
    }

    function withdrawAllowance(address _allower, uint _amount) external sufficientAllowance(_allower, msg.sender, _amount) {
        allowance[_allower] -= _amount;
        balances[_allower] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}