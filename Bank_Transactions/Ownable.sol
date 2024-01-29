// This is an Ownable contract from OpenZeppelin

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Ownable {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner returns (bool) {
        owner = newOwner;
        return true;
    }
}