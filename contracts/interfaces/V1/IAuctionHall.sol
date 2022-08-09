// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IAuctionHall {
    enum AuctionPhase {
        GENESIS,
        PHASE_1,
        PHASE_2,
        LEGACY,
        FINISHED
    }

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

    // Events
    event AuctionInitiated(address indexed positionAddr);
    event BidTanto(address indexed positionAddr, address indexed ruler, uint256 bidSize, uint256 priorityFee);
    event BidKatana(address indexed positionAddr, address indexed ruler, uint256 debtSize, uint256 usedCash, uint256 dexCoverReward);
    event AuctionFinished(address indexed positionAddr, address indexed trader, uint256 indexed phase);
    event Phase1Finished(address indexed positionAddr);
    event Phase1Rollback(address indexed positionAddr);
    event Retrieve(address indexed positionAddr, uint256 stableTokenSize, uint256 debtTokenSize, uint256 priorityFee);
}
