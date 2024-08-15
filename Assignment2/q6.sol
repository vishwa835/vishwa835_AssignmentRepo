// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // A mapping to store the number of votes each candidate has received.
    mapping(string => uint256) public votes;

    // This function allows a user to vote for a candidate.
    function vote(string memory candidate) public {
        votes[candidate] += 1;  // Increment the vote count for the candidate.
    }

    // This function returns the number of votes a candidate has received.
    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
