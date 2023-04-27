// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //Mappings
    mapping(uint => string) names;

    struct Book {
        string title;
        string author;
    }

    constructor() public {
        names[1] = "Adam";
        names[2] = "Aapsi";
        names[3] = "Avon";
    }