# IU2141230210
# Solidity Smart Contracts Collection

This repository contains a collection of basic Solidity smart contracts, each demonstrating fundamental concepts in Ethereum smart contract development.

## Contracts Overview

1. **Crowdfunding Contract**
   - **Description:** Implements a crowdfunding platform where users can create campaigns, contribute Ether to campaigns, and finalize or withdraw funds based on the campaign's success.
   - **File:** [q1.sol](q1.sol)
   - **Key Functions:**
     - `createCampaign(uint256 _targetAmount, uint256 _duration)`: Creates a new crowdfunding campaign.
     - `contribute(uint256 _campaignId)`: Contributes Ether to a specific campaign.
     - `finalizeCampaign(uint256 _campaignId)`: Finalizes a campaign and transfers funds if the target amount is met.
     - `withdrawFunds(uint256 _campaignId)`: Withdraws funds if the campaign failed to meet its target.
     - `getCampaign(uint256 _campaignId)`: Retrieves details of a specific campaign.

2. **Voting System Contract**
   - **Description:** Implements a simple voting system where users can create proposals, vote for them, and retrieve vote counts or find the winning proposal.
   - **File:** [q2.sol](q2.sol)
   - **Key Functions:**
     - `CreateProposal(string memory C_name)`: Creates a new proposal with a specified name.
     - `VoteForSomeOne(uint _ProposalId)`: Allows users to vote for a proposal.
     - `HowMuchVoteCandidateHas(uint _ProposalId)`: Returns the number of votes and the name of a specific proposal.
     - `WhoIsWinner()`: Returns the name of the proposal with the highest number of votes.
