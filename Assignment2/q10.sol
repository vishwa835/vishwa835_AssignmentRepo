// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStorage {
    // A state variable to store a message.
    string private message;

    // This function allows the user to set a message.
    function setMessage(string memory _message) public {
        message = _message;
    }

    // This function returns the currently stored message.
    function getMessage() public view returns (string memory) {
        return message;
    }
}
