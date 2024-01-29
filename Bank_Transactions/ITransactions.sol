// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

/**
 * @title ITransactions
 * @dev Interface for managing bank transactions.
 */
interface ITransactions {

    /**
     * @dev Withdraws the specified amount from the contract balance.
     * @param _amount The amount to withdraw.
     */
    function withdrawBalance(uint _amount) external;

    /**
     * @dev Transfers the specified amount from the contract balance to the recipient.
     * @param _recipient The address of the recipient.
     * @param _amount The amount to transfer.
     */
    function transferBalance(address _recipient, uint _amount) external;

    /**
     * @dev Deposits the sent Ether to the contract balance.
     */
    function depositBalance() payable external;

    /**
     * @dev Adds an allowance balance for the specified beneficiary.
     * @param _beneficiary The address of the beneficiary.
     * @param _amount The amount to add as allowance.
     */
    function addAllowanceBalance(address _beneficiary, uint _amount) external;

    /**
     * @dev Withdraws the specified amount from the allowance balance of the allower.
     * @param _allower The address of the allower.
     * @param _amount The amount to withdraw from the allowance balance.
     */
    function withdrawAllowance(address _allower, uint _amount) external;
}