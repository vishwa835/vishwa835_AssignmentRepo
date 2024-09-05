// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashWithPrefix {
    function findHashWithPrefix(string memory prefix, uint256 maxIterations) public pure returns (string memory, bytes32) {
        uint256 i = 0;
        while (i < maxIterations) {
            string memory input = string(abi.encodePacked(i));
            bytes32 hash = sha256(abi.encodePacked(input));
            if (startsWith(hash, prefix)) {
                return (input, hash);
            }
            i++;
        }
        return ("", bytes32(0)); // Return empty values if no match is found within maxIterations
    }

    function startsWith(bytes32 hash, string memory prefix) internal pure returns (bool) {
        bytes memory hashBytes = abi.encodePacked(hash);
        bytes memory prefixBytes = bytes(prefix);
        for (uint256 i = 0; i < prefixBytes.length; i++) {
            if (hashBytes[i] != prefixBytes[i]) {
                return false;
            }
        }
        return true;
    }
}
