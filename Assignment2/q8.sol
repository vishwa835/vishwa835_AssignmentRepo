// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    // An event to log a message whenever the log function is called.
    event LogMessage(string message);

    // This function logs the provided message by emitting the LogMessage event.
    function log(string memory message) public {
        emit LogMessage(message);
    }
}
