// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameStorage {
    // A state variable to store a user's name.
    string private name;

    // This function allows the user to set their name.
    function setName(string memory _name) public {
        name = _name;
    }

    // This function returns the current stored name.
    function getName() public view returns (string memory) {
        return name;
    }
}
