// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint public count = 0; //state variable which is stored on the bblockchain, we have to pay gas
    // unit -> can be 1,2,3,.... ut cannot e negative

/* we can remove constructer function as well because solidity lets you define the default value like uint public count = 0;
//it is a special function which is run only once
//we made it pulic so that it can be called wherewher the contract is initiaslized
    constructor() public {
        count = 0;
    }*/

/* we dont need to create a getCount function instead we can do-> uint public count;

//read function-> we dont have to pay gas
    function getCount() public view returns(uint) {
        return count;// public means we can access the smart contract from anywhere; also we will have read access to it after we deploy the smart contract
    }
    */

//write function-> we have to pay gas
    function incrementCount() public {
        count = count= count + 1;

    }
}
//when we put a smart contract on a blockchain we make a transaction and thats why we need to pay gas fees