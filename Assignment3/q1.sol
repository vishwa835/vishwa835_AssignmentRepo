// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Lottery{
    address public manager; // Manager's address (the one who deploys the contract)
    address payable[] public players; // Array to store addresses of players who enter the lottery

    // Constructor to initialize the manager as the contract deployer
    constructor(){
        manager = msg.sender;
    }

    // Function to check if the caller has already entered the lottery
    function alreadyEntered() view private returns(bool){
        for(uint i=0;i<players.length;i++){
            if(players[i]==msg.sender)
            return true;
        }
        return false;
    }
    
    // Function to allow users to enter the lottery
    function enter() payable public {
        require(msg.sender!=manager,"Manager Cannot Enter");
        require(alreadyEntered() == false,"Player already entered");
        require(msg.value >= 1 ether,"Minimum amount must be payed");
        players.push(payable(msg.sender));
    }

    // Private function to generate a pseudo-random number
    function random() view private returns(uint){
        return uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
    }
      
    // Function for the manager to pick a winner from the players
    function pickWinner() public{
        require(msg.sender == manager,"Only manager can pick the winner");
        uint index = random()%players.length;
        address contractAddress = address(this);
        players[index].transfer(contractAddress.balance);
        players = new address payable[](0);

    }

    // Function to get the list of players who entered the lottery
    function getPlayers() view public returns(address payable[] memory){
        return players;
    }

}