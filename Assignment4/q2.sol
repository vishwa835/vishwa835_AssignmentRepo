// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashWithPrefixAndStart {
    event HashFound(string input, bytes32 hash);
    event Iteration(uint256 iteration, bytes32 hash);

    // Function to find a hash that starts with the specified prefix
    // but limited by a maximum number of iterations to avoid gas issues
    function findHashWithPrefixAndStart(string memory prefix, uint256 maxIterations) public returns (string memory, bytes32) {
        uint256 i = 0;
        string memory startStr = "devadnani26"; // Set the startStr to "devadnani26"
        bytes32 prefixHash = keccak256(abi.encodePacked(prefix));
        
        while (i < maxIterations) {
            // Concatenate the startStr with the current iteration number
            string memory input = string(abi.encodePacked(startStr, i));
            // Calculate the keccak256 hash
            bytes32 hash = keccak256(abi.encodePacked(input));
            // Emit iteration event
            emit Iteration(i, hash);
            // Check if the hash starts with the given prefix
            if (startsWith(hash, prefixHash)) {
                emit HashFound(input, hash);
                return (input, hash);
            }
            i++;
        }
        // If no matching hash was found within the maximum iterations, revert the transaction
        revert("Max iterations reached without finding a match");
    }

    // Helper function to check if the hash starts with the prefix
    function startsWith(bytes32 hash, bytes32 prefixHash) internal pure returns (bool) {
        return (hash & prefixHash) == prefixHash;
    }
}
