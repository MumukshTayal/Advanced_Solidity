// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "./Ownable.sol";
import "./ITransactions.sol";

contract ProxyContract is Ownable {
    ITransactions public Transactions;

    constructor(ITransactions _Transactions) {
        Transactions = _Transactions;
    }

    function switchOwner(address _newOwner) public onlyOwner returns (bool) {
        return transferOwnership(_newOwner);
    }

    function switchImplementation(ITransactions _anotherImplementation) public onlyOwner returns (bool) {
        Transactions = _anotherImplementation;
        return true;
    }

    function withdrawBalance(uint _amount) public {
        Transactions.withdrawBalance(_amount);
    }

    function transferBalance(address _recipient, uint _amount) public {
        Transactions.transferBalance(_recipient, _amount);
    }

    function depositBalance() payable public {
        Transactions.depositBalance();
    }

    function addAllowanceBalance(address _beneficiary, uint _amount) public {
        Transactions.addAllowanceBalance(_beneficiary, _amount);
    }

    function withdrawAllowance(address _allower, uint _amount) public {
        Transactions.withdrawAllowance(_allower, _amount);
    }
}