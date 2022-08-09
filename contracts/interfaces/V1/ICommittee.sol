// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface ICommittee {
    enum ProposalStatus {
        Active,
        Passed,
        Failed,
        Queued,
        Executed
    }

    function deposit(uint256 amount) external;

    function withdraw(uint256 amount) external;

    function createPoolProposal(
        address stakedToken,
        uint256 leverage,
        uint256 durationDays
    ) external;

    function vote(
        uint256 proposalId,
        bool direction,
        uint256 voteShare
    ) external;

    function isRuler(address account) external view returns (bool);

    function getUserShares(address account) external view returns (uint256 totalShare, uint256 lockedShare);

    function proposalGallery(uint256 proposalId)
        external
        view
        returns (
            uint32 id, // Unique id for looking up a proposal
            address proposer, // Creator of the proposal
            uint32 catagory, // 1 = pool 2 = community
            uint64 startBlock, // The block voting starts from
            uint64 endBlock, // The block voting ends at
            uint256 forShares, // Current number of votes in favor of this proposal
            uint256 againstShares, // Current number of votes in opposition to this proposal
            ProposalStatus status,
            bool displayable
        );

    /// @notice Emitted when a new proposal was created
    event PoolProposalCreated(uint256 indexed proposalId, address indexed proposer);
    /// @notice Emitted when a community proposal was created
    event CommunityProposalCreated(uint256 indexed proposalId, address indexed proposer, string description, string title);
    /// @notice Emitted when one Ruler vote a specified proposal
    event ProposalVoted(uint256 indexed proposalId, address indexed user, bool direction, uint256 voteShare);
    /// @notice Emitted when a proposal was canceled
    event ProposalStatusChanged(uint256 indexed proposalId, uint256 ps);
    /// @notice Emitted when admin tweak the voting period
    event VotingMaxDaysSet(uint256 maxVotingDays);
    /// @notice Emitted when admin tweak ruler threshold parameter
    event RulerThresholdSet(uint256 oldRulerThreshold, uint256 newRulerThreshold);
    /// @notice Emitted when user deposit IPISTRs to Committee vault
    event DepositCommittee(address indexed user, uint256 depositAmount, uint256 totalAmount);
    /// @notice Emitted when user withdraw IPISTRs from Committee vault
    event WithdrawCommittee(address indexed user, uint256 withdrawAmount, uint256 totalAmount);
}
