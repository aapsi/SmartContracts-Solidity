// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// is -> enables inheritance
// Inheritance - where you inherit properties from parent Smart contract
// Factories - where you deploy smartcontracts within a contract
// Interaction - when you wanna talk to other smart contracts inside a smart contract function

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract Secret is Ownable {
    address secretVault;
    // we need an address to reference the secret valut smart contract

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        //here we created a secret valut whenever this smart contract is deployed
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
        // here we are calling a smart contract inside a snother smart contract by giving its address
    }
}