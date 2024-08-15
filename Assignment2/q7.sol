// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnly {
    // State variable to store the address of the contract owner.
    address public owner;

    // Constructor that sets the owner to the address that deployed the contract.
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to functions to only the owner.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Function that can only be called by the owner.
    function restrictedFunction() public onlyOwner {
        emit RestrictedAction("Restricted function was called by the owner.");
    }

    // Event that is emitted when the restricted function is called.
    event RestrictedAction(string message);
}
