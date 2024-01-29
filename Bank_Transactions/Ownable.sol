// This is an Ownable contract from OpenZeppelin

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

/**
 * @title Ownable
 * @dev The Ownable contract provides basic authorization control functions.
 * It assigns an owner address that can be used to restrict access to certain functions.
 */
contract Ownable {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    /**
     * @dev Transfers ownership of the contract to a new address.
     * @param newOwner The address to transfer ownership to.
     * @return A boolean value indicating whether the ownership transfer was successful or not.
     */
    function transferOwnership(address newOwner) public onlyOwner returns (bool) {
        owner = newOwner;
        return true;
    }
}