# Bank Transactions

This project contains Solidity smart contracts for bank transactions.

## Functions

### `withdrawBalance(uint _amount)`

Withdraws the specified amount from the contract balance.

Parameters:
- `_amount`: The amount to withdraw.

### `transferBalance(address _recipient, uint _amount)`

Transfers the specified amount from the contract balance to the recipient.

Parameters:
- `_recipient`: The address of the recipient.
- `_amount`: The amount to transfer.

### `depositBalance() payable`

Deposits the sent Ether to the contract balance.

### `addAllowanceBalance(address _beneficiary, uint _amount)`

Adds an allowance balance for the specified beneficiary.

Parameters:
- `_beneficiary`: The address of the beneficiary.
- `_amount`: The amount to add as allowance.

### `withdrawAllowance(address _allower, uint _amount)`

Withdraws the specified amount from the allowance balance of the allower.

Parameters:
- `_allower`: The address of the allower.
- `_amount`: The amount to withdraw from the allowance balance.
