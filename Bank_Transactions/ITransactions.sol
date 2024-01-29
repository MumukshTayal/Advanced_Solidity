// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

interface ITransactions {

    function withdrawBalance(uint _amount) external;

    function transferBalance(address _recipient, uint _amount) external;

    function depositBalance() payable external;

    function addAllowanceBalance(address _beneficiary, uint _amount) external;

    function withdrawAllowance(address _allower, uint _amount) external;
}