// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoteingSystem{
    // To store name of proposals an vote
    struct Proposal{
        string name;
        uint256 votes;
    }
    // private list og proposals
    Proposal []private Proposals ;
    // collecting data for every address how may proposal has it vote for
    mapping (address => mapping (uint => bool)) VoterId;
    // to create proposlas
    function CreateProposal(string memory C_name)public returns(uint256){
        // pushig instance of proposal to the array with name of proposals
        Proposals.push(Proposal({name:C_name,votes:0}));
        // returning id of proposal
        return Proposals.length;
    }
    // for voting
    function VoteForSomeOne(uint _ProposalId)public{
        // checking if proposal exist and address has already vote for it or not 
        require(_ProposalId<Proposals.length,"Invalide _Proposal Id");
        require(!VoterId[msg.sender][_ProposalId] ,"You Have Allready Voted");
        // chaging valuse of vote for this proposal
        VoterId[msg.sender][_ProposalId] = true;
        // incrementing votes for proposal
        Proposals[_ProposalId].votes+=1;
    }

// to finds how much vte does single proposal have
    function HowMuchVoteCandidateHas(uint _ProposalId) public view  returns (string memory ,uint256) {
        // checking if proposal exist or not
        require(_ProposalId<Proposals.length,"Invalide _Proposal Id");
        // returning how mush vote a proposal have with it's name 
        return (Proposals[_ProposalId].name,Proposals[_ProposalId].votes);
    }

// to find the winner
    function WhoIsWinner()public view returns (string memory){
        // to store how mush vote does winner have
        uint256 winningVoteCount = 0;
        // to store winner's Id
        uint256 winningProposalId = 0;
        // Going throught all the proposals
        for (uint256 i = 0; i < Proposals.length; i++) {
            // checking if currently stored id has more vote or not
            if (Proposals[i].votes > winningVoteCount) {
                // if new id have more vote then change the value of the stored winning id
                winningVoteCount = Proposals[i].votes;
                winningProposalId = i;
                }
            }
        // returnig the name of proposal
        return (Proposals[winningProposalId].name);
    }
}