// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "./IPoolGuardian.sol";

interface IStrPool {
    function deposit(uint256 amount) external;

    function withdraw(uint256 percent, uint256 amount) external;

    function withdrawRemnantAsset(address position) external;

    function isDelivery() external view returns (bool);

    function getInfo()
        external
        view
        returns (
            address creator,
            address stakedToken,
            address stableToken,
            address wrappedToken,
            uint256 leverage,
            uint256 durationDays,
            uint256 startBlock,
            uint256 endBlock,
            uint256 id,
            uint256 stakedTokenDecimals,
            uint256 stableTokenDecimals,
            IPoolGuardian.PoolStatus stateFlag
        );

    function positionInfoMap(address position)
        external
        view
        returns (
            address trader,
            bool closedFlag,
            uint64 lastestFeeBlock,
            uint256 totalSize,
            uint256 unsettledCash,
            uint256 remnantAsset,
            uint256 totalFee
        );

    function getFundingFee(address position) external view returns (uint256 totalFee_);

    /// @notice Emitted when a new pool is created
    event PoolActivated(uint256 indexed poolId);
    /// @notice Emitted when user deposit tokens into a pool
    event Deposit(address indexed user, uint256 indexed poolId, uint256 amount);
    /// @notice Emitted when user harvest from a pool
    event Harvest(address indexed user, uint256 indexed poolId, uint256 pending);
    /// @notice Emitted when user withdraw from a pool
    event Withdraw(address indexed user, uint256 indexed poolId, uint256 amount);
    /// @notice Emitted when user borrow tokens from a pool
    event Borrow(address indexed user, uint256 indexed poolId, uint256 amount);
    /// @notice Emitted when user repay fund to a pool
    event Repay(address indexed user, uint256 indexed poolId, uint256 amount);
}
