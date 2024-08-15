// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting {
    // A state variable to store a personalized greeting message.
    string private greeting;

    // This function allows the user to set a personalized greeting message.
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    // This function returns the current greeting message.
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
