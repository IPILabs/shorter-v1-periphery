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
}
