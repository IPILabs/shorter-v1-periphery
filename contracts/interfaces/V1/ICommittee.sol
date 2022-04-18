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

    function getUserShares(address account)
        external
        view
        returns (uint256 totalShare, uint256 lockedShare);

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
}
