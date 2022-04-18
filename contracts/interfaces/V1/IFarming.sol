// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IFarming {
    function stake(uint256 poolId, uint256 amount) external;

    function unStake(uint256 poolId, uint256 amount) external;

    function getBalance(uint256 poolId, address user)
        external
        view
        returns (uint256);

    function poolInfoMap(uint256 poolId)
        external
        view
        returns (
            uint64 id,
            uint64 stateFlag,
            uint256 stakedAmount,
            address stakedLpToken,
            address token0,
            address token1
        );

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
