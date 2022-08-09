// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IFarming {
    function stake(uint256 amount) external;

    function unStake(uint256 amount) external;

    function lpToken() external view returns (address);

    function getUserStakedAmount(address user) external view returns (uint256 userStakedAmount);

    function allPendingRewards(address user)
        external
        view
        returns (
            uint256 govRewards,
            uint256 farmingRewards,
            uint256 voteAgainstRewards,
            uint256 tradingRewards,
            uint256 stakedRewards,
            uint256 creatorRewards,
            uint256 voteRewards,
            uint256[] memory tradingRewardPools,
            uint256[] memory stakedRewardPools,
            uint256[] memory createRewardPools,
            uint256[] memory voteRewardPools
        );

    function harvestAll(
        uint256 govRewards,
        uint256 farmingRewards,
        uint256 voteAgainstRewards,
        uint256[] memory tradingRewardPools,
        uint256[] memory stakedRewardPools,
        uint256[] memory createRewardPools,
        uint256[] memory voteRewardPools
    ) external;
}
