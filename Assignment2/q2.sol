// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // A state variable to store an integer value.
    uint256 private storedValue;

    // This function allows the user to set the value of storedValue.
    function set(uint256 x) public {
        storedValue = x;
    }

    // This function returns the current value of storedValue.
    function get() public view returns (uint256) {
        return storedValue;
    }
}
