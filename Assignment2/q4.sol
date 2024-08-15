// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // A state variable to store the count.
    uint256 private count;

    // This function increments the count by 1.
    function increment() public {
        count += 1;
    }

    // This function returns the current count value.
    function getCount() public view returns (uint256) {
        return count;
    }
}
