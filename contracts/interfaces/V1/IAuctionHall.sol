// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IAuctionHall {
    function bidTanto(
        address position,
        uint256 bidSize,
        uint256 priorityFee
    ) external;

    function bidKatana(address position, bytes memory path) external;

    function queryResidues(address position, address ruler)
        external
        view
        returns (
            uint256 stableTokenSize,
            uint256 debtTokenSize,
            uint256 priorityFee
        );

    function retrieve(address position) external;

    function phase1Infos(address position)
        external
        view
        returns (
            uint256 bidSize,
            uint256 liquidationPrice,
            bool isSorted,
            bool flag
        );

    function phase2Infos(address position)
        external
        view
        returns (
            bool flag,
            bool isWithdrawn,
            address rulerAddr,
            uint256 debtSize,
            uint256 usedCash,
            uint256 dexCoverReward
        );
}
