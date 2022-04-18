// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IPoolGuardian {
    enum PoolStatus {
        GENESIS,
        RUNNING,
        LIQUIDATING,
        RECOVER,
        ENDED
    }

    function getPoolsByState(PoolStatus status)
        external
        view
        returns (uint256[] memory);

    function getPoolInfo(uint256 poolId)
        external
        view
        returns (
            address stakedToken,
            address stableToken,
            address strToken,
            PoolStatus stateFlag
        );

    function getCreatedPoolIds(address creator)
        external
        view
        returns (uint256[] memory poolIds);
}
