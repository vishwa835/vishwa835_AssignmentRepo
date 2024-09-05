// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FindNonce {
    
    // Function to find nonce for which the hash of (inputStr + nonce) starts with the prefix
    function findNonce(string memory inputStr, bytes memory prefix, uint256 maxIterations) public pure returns (uint256, bytes32) {
        uint256 nonce = 0;
        while (nonce < maxIterations) {
            string memory data = string(abi.encodePacked(inputStr, uint2str(nonce)));
            bytes32 hash = sha256(abi.encodePacked(data));
            
            if (startsWith(hash, prefix)) {
                return (nonce, hash);  // Return nonce and hash if matching prefix is found
            }
            nonce++;
        }
        
        return (0, "");  // Return 0 and empty hash if no valid nonce is found within maxIterations
    }

    // Helper function to check if the hash starts with the given prefix bytes
    function startsWith(bytes32 hash, bytes memory prefix) internal pure returns (bool) {
        bytes memory hashBytes = abi.encodePacked(hash);
        for (uint256 i = 0; i < prefix.length; i++) {
            if (hashBytes[i] != prefix[i]) {
                return false;
            }
        }
        return true;
    }

    // Helper function to convert uint256 to string
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bstr[k] = bytes1(temp);
            _i /= 10;
        }
        return string(bstr);
    }
}
