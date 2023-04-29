// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    event Occupy(address _occupant, uint _value);
    // event lets you listen to any changes in state in a bblockchain

    address payable public owner;// payable beacause the owner will recieve or send crypto

    // vacant
    // occupied
    enum Statuses {
         Vacant,
         Occupied
    }
    
    Statuses public currentStatus;
    // enums is a collection of options that will never change, its a data structure in solidity

    constructor() {
        owner = payable(msg.sender);
        // msg is a global variable
        // sender is the property on message which tells you 
        // who has called this function and who has deployed this contract on blockchain
        currentStatus = Statuses.Vacant;
        // set default status
    }
    
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _; // this returns the function code
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        // WE CAN USE MODIFIERS FOR CHECKING, IT CLEANS OUT THE CODE AND ALSO MAKES IT REUSEABLE
        // check price
        // require(msg.value >= 2 ether, "Not enough ether provided.")
        // check status
        // require(currentStatus == Statuses.Vacant, "Currently occupied.");
        // require is a fucntion given by solidity for free
        // whencer it is used inside a fucntion it checks whether a statement is true or false
        // when this is true it lets it continue executing next lines, when false it stops execution
        // and other lines of code dont run
        currentStatus = Statuses.Occupied;

        // using transfer inside a func can create issues
        // so we can use call method
        /*owner.transfer(msg.value);*/
        //transfer will transfer cryptocurrency to the owner
        // value is a global variale which will have the cryptocurrency
        // amount of ether transfered to the owner whenever transfer fucntion is called

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        // sent will tell you the status and data can bbe a msg came back by the fuction
        require(true);
        // if its true it will go ahead with the transaction

        emit Occupy(msg.sender, msg.value);
        // we can get an alert anytime someone bbooks the room
    }
}