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

    function queryPools(address stakedToken, PoolStatus status) external view returns (uint256[] memory);

    function getPoolInfo(uint256 poolId)
        external
        view
        returns (
            address stakedToken,
            address strToken,
            PoolStatus stateFlag
        );

    function getCreatedPoolIds(address creator) external view returns (uint256[] memory poolIds);

    /// @notice Emitted when this contract is deployed
    event PoolGuardianInitiated();
    /// @notice Emitted when a delisted pool go back
    event PoolListed(uint256 indexed poolId);
    /// @notice Emitted when a listing pool is delisted
    event PoolDelisted(uint256 indexed poolId);
}
