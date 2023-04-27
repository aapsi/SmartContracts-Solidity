// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //state variable-> saved foreever on the blockchain, scope is entire smart contract
    int256 public myInt = 1;//it can have -ve integers as well
    int256 public myInt256 = 1; //-ve allowed
    uint public myUint = 1;
    uint256 public myUint256  = 1;
    uint8 public myUint8 =1;

    string public myString = "Hello world";
    bytes32 public myBytes32 = "hello world"; //here string is treated like an array and has more flexibility than the above method

    address public myAddress = 0xddaAd340b0f1Ef65169Ae5E41A8b10776a75482d;

    //you can create your own complex datatype using struct
    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    //initialising struct
    MyStruct public myStruct = MyStruct(1, "Hello World!");

    // local variable
    //pure-> does not modify the state of the blockchain
    function getValue() public pure returns(uint) {
        uint value = 1;// this cannot be accesed from any other function as this is a local variable its scole lies within this function
        return value;
    }
}