// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    address public owner;
    mapping(address => uint256) public donations;

    event DonationReceived(address indexed donor, uint256 amount);
    event DonationTransferred(address indexed recipient, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than 0");
        donations[msg.sender] += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function transferDonation(address payable recipient, uint256 amount) public {
        require(msg.sender == owner, "Only owner can transfer donations");
        require(address(this).balance >= amount, "Insufficient balance");
        recipient.transfer(amount);
        emit DonationTransferred(recipient, amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
