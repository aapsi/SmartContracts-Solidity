// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
    owner = msg.sender;
}
}
// is -> enables inheritance
contract MyContract is Ownable {
    // Inheritance - where you inherit properties from parent smart contract
    // Factories - where you deploy smartcontracts within a contract
    // Interaction - when you wanna talk to other smart contracts inside a smart contract function

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor(string memory _secret) public {
        secret = _secret;
        super; // it can call the constructor from the parent 
    }

    function getSecret() public view onlyOwner returns(string memory) {
        return secret;
    }

}