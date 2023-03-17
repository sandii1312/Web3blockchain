pragma solidity ^0.8.7;
//  SPDX-License-Identifier: MIT

contract sample{
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external{
        balance=balance + msg.value;
    }

    function withdraw(uint amount,address payable destAddr){
        require(msg.sender==owner,"Only the owner can withdraw");
        require(amount<=balance,"Insufficient funds");

        destAddr.transfer(amount);
        balance-=amount;
    }
}