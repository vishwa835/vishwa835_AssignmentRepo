// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLedger {
    // A struct to represent an entry in the ledger.
    struct Entry {
        string description; 
        uint256 amount;      
    }

    // An array to store all ledger entries.
    Entry[] public entries;

    // This function adds a new entry to the ledger.
    function addEntry(string memory description, uint256 amount) public {
        entries.push(Entry(description, amount));
    }

    // This function returns the details of an entry at a specific index.
    function getEntry(uint256 index) public view returns (string memory, uint256) {
        Entry storage entry = entries[index];
        return (entry.description, entry.amount);
    }
}
