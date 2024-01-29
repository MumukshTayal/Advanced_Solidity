// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "./Ownable.sol";
import "./ITransactions.sol";

/**
 * @title ProxyContract
 * @dev A contract that acts as a proxy for executing transactions through an implementation contract.
 */
contract ProxyContract is Ownable {
    ITransactions public Transactions;

    constructor(ITransactions _Transactions) {
        Transactions = _Transactions;
    }

    /**
     * @dev Switches the owner of the contract to a new address.
     * @param _newOwner The address of the new owner.
     * @return A boolean indicating whether the ownership transfer was successful.
     */
    function switchOwner(address _newOwner) public onlyOwner returns (bool) {
        return transferOwnership(_newOwner);
    }

    /**
     * @dev Switches the implementation contract to a new implementation.
     * @param _anotherImplementation The address of the new implementation contract.
     * @return A boolean indicating whether the implementation switch was successful.
     */
    function switchImplementation(ITransactions _anotherImplementation) public onlyOwner returns (bool) {
        Transactions = _anotherImplementation;
        return true;
    }

    /**
     * @dev Withdraws a specified amount of balance from the implementation contract.
     * @param _amount The amount of balance to withdraw.
     */
    function withdrawBalance(uint _amount) public {
        Transactions.withdrawBalance(_amount);
    }

    /**
     * @dev Transfers a specified amount of balance to a recipient address using the implementation contract.
     * @param _recipient The address of the recipient.
     * @param _amount The amount of balance to transfer.
     */
    function transferBalance(address _recipient, uint _amount) public {
        Transactions.transferBalance(_recipient, _amount);
    }

    /**
     * @dev Deposits the sent Ether balance to the implementation contract.
     */
    function depositBalance() payable public {
        Transactions.depositBalance();
    }

    /**
     * @dev Adds an allowance balance for a beneficiary address using the implementation contract.
     * @param _beneficiary The address of the beneficiary.
     * @param _amount The amount of allowance balance to add.
     */
    function addAllowanceBalance(address _beneficiary, uint _amount) public {
        Transactions.addAllowanceBalance(_beneficiary, _amount);
    }

    /**
     * @dev Withdraws a specified amount of allowance balance from the implementation contract.
     * @param _allower The address of the allower.
     * @param _amount The amount of allowance balance to withdraw.
     */
    function withdrawAllowance(address _allower, uint _amount) public {
        Transactions.withdrawAllowance(_allower, _amount);
    }
}