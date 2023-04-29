// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //Arrays
    uint[] public uintArray = [1,2,3];
    string[] public stringArray = ["apples", "bananas", "peaches"];
    string[] public values;
    uint256[][] public array2D = [[1,2,3], [4,5,6]];
    //memory-> This is required for all reference types such as arrays, structs, mappings, and strings.
    function addValue(string memory _value) public {
        values.push(_value);
    } 

    function valueCount() public view returns(uint) {
        return values.length;
    }
}