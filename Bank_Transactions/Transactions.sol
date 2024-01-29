// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "./Ownable.sol";

/**
 * @title Transactions
 * @dev A smart contract for managing bank transactions.
 */
contract Transactions is Ownable {
    mapping(address => uint) internal balances;
    mapping(address => address) internal allowers;
    mapping(address => uint) internal allowance;

    /**
     * @dev Modifier to check if the sender has sufficient funds.
     * @param _amount The amount of funds required.
     */
    modifier sufficientFunds(uint _amount) {
        require(balances[msg.sender] >= _amount, "Insufficient funds!");
        _;
    }

    /**
     * @dev Modifier to check if the specified allower has sufficient allowance available for the beneficiary.
     * @param _allower The address of the allower.
     * @param _beneficiary The address of the beneficiary.
     * @param _amount The amount of allowance required.
     */
    modifier sufficientAllowance(address _allower, address _beneficiary, uint _amount) {
        require(allowers[msg.sender] == _allower, "Specified allower not found!");
        require(allowance[allowers[_beneficiary]] >= _amount, "Insufficient allowance available!");
        _;
    }

    /**
     * @dev Modifier to check if the sender has paid the required fee.
     */
    modifier paymentFee() {
        require(msg.value == 0.05 ether, "You need to pay 0.05 ether to perform the funds transfer!");
        _;
    }

    /**
     * @dev Withdraws the specified amount from the sender's balance.
     * @param _amount The amount to be withdrawn.
     */
    function withdrawBalance(uint _amount) sufficientFunds(_amount) external {
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    /**
     * @dev Transfers the specified amount from the sender's balance to the recipient's balance.
     * @param _recipient The address of the recipient.
     * @param _amount The amount to be transferred.
     */
    function transferBalance(address _recipient, uint _amount) paymentFee payable sufficientFunds(_amount) external {
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }

    /**
     * @dev Deposits the sent value to the sender's balance.
     */
    function depositBalance() payable external {
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Adds allowance balance for the specified beneficiary.
     * @param _beneficiary The address of the beneficiary.
     * @param _amount The amount of allowance to be added.
     */
    function addAllowanceBalance(address _beneficiary, uint _amount) sufficientFunds(_amount) external {
        allowers[_beneficiary] = msg.sender;
        allowance[msg.sender] += _amount;
    }

    /**
     * @dev Withdraws the specified amount from the allower's allowance and balance, and transfers it to the sender.
     * @param _allower The address of the allower.
     * @param _amount The amount to be withdrawn.
     */
    function withdrawAllowance(address _allower, uint _amount) external sufficientAllowance(_allower, msg.sender, _amount) {
        allowance[_allower] -= _amount;
        balances[_allower] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}