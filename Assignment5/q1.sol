pragma solidity >=0.8.2 < 0.9.0;

contract Crowdfunding {
    
    // Struct to store details of a crowdfunding campaign
    struct Campaign {
        address creator;               
        uint256 targetAmount;          
        uint256 deadline;              
        uint256 totalContributions;    
        bool finalized;                
        mapping(address => uint256) contributions;
    }

    // Mapping to store all campaigns by their ID
    mapping(uint256 => Campaign) public campaigns;
    uint256 public campaignCount;

    // Event emitted when a new campaign is created
    event CampaignCreated(uint256 campaignId, address creator, uint256 targetAmount, uint256 deadline);
    
    // Event emitted when a contribution is made to a campaign
    event ContributionMade(uint256 campaignId, address contributor, uint256 amount);
    
    // Event emitted when a campaign is finalized
    event CampaignFinalized(uint256 campaignId, bool success);
    
    // Event emitted when a refund is issued to a contributor
    event RefundIssued(uint256 campaignId, address contributor, uint256 amount);

    // Function to create a new campaign
    function createCampaign(uint256 _targetAmount, uint256 _duration) external {
        require(_targetAmount > 0, "Target amount must be greater than zero");
        require(_duration > 0, "Duration must be greater than zero");

        campaignCount++;
        Campaign storage newCampaign = campaigns[campaignCount];
        newCampaign.creator = msg.sender;
        newCampaign.targetAmount = _targetAmount;
        newCampaign.deadline = block.timestamp + _duration;
        newCampaign.finalized = false;

        emit CampaignCreated(campaignCount, msg.sender, _targetAmount, newCampaign.deadline);
    }

    // Function to contribute Ether to a specific campaign
    function contribute(uint256 _campaignId) external payable {
        Campaign storage campaign = campaigns[_campaignId];

        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");
        require(!campaign.finalized, "Campaign is finalized");

        campaign.totalContributions += msg.value;
        campaign.contributions[msg.sender] += msg.value;

        emit ContributionMade(_campaignId, msg.sender, msg.value);
    }

    // Function to finalize a campaign and transfer funds if the target is met
    function finalizeCampaign(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];

        require(msg.sender == campaign.creator, "Only the creator can finalize the campaign");
        require(block.timestamp >= campaign.deadline, "Campaign is still ongoing");
        require(!campaign.finalized, "Campaign is already finalized");

        campaign.finalized = true;

        if (campaign.totalContributions >= campaign.targetAmount) {
            payable(campaign.creator).transfer(campaign.totalContributions);
            emit CampaignFinalized(_campaignId, true);
        } else {
            emit CampaignFinalized(_campaignId, false);
        }
    }

    // Function to withdraw funds if the campaign was not successful
    function withdrawFunds(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        uint256 contribution = campaign.contributions[msg.sender];

        require(campaign.finalized, "Campaign is not finalized");
        require(contribution > 0, "No funds to withdraw");

        if (campaign.totalContributions < campaign.targetAmount) {
            campaign.contributions[msg.sender] = 0;
            payable(msg.sender).transfer(contribution);
            emit RefundIssued(_campaignId, msg.sender, contribution);
        }
    }

    // Function to get details of a specific campaign
    function getCampaign(uint256 _campaignId) external view returns (
        address creator,
        uint256 targetAmount,
        uint256 deadline,
        uint256 totalContributions,
        bool finalized
    ) {
        Campaign storage campaign = campaigns[_campaignId];
        return (
            campaign.creator,
            campaign.targetAmount,
            campaign.deadline,
            campaign.totalContributions,
            campaign.finalized
        );
    }
}
