// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A simple contract that returns the message "Hello, World!"
contract HelloWorld {
    
    // Function to return the string "Hello, World!"
    function sayHello() public pure returns (string memory) {
        return "Hello, World!";  // Return the fixed string
    }
}
