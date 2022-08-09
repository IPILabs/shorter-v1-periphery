// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface ITradingHub {
    enum PositionState {
        GENESIS,
        OPEN, //1
        CLOSING, //2
        OVERDRAWN, // 3
        CLOSED // 4
    }

    function sellShort(
        uint256 poolId,
        uint256 amount,
        uint256 amountOutMin,
        address swapRouter,
        bytes memory path
    ) external;

    function buyCover(
        uint256 poolId,
        uint256 amount,
        uint256 amountInMax,
        address swapRouter,
        bytes memory path
    ) external;

    function getPositionInfo(address position)
        external
        view
        returns (
            uint256 poolId,
            address strToken,
            uint256 closingBlock,
            PositionState positionState
        );

    function getPositions(address account) external view returns (address[] memory positions);

    function isPoolWithdrawable(uint256 poolId) external view returns (bool);

    function getPositionsByPoolId(uint256 poolId, PositionState positionState) external view returns (address[] memory);

    function getPositionsByState(PositionState positionState) external view returns (address[] memory);

    // Events
    event PositionOpened(uint256 indexed poolId, address indexed trader, address indexed positionAddr, uint256 orderSize);
    event PositionIncreased(uint256 indexed poolId, address indexed trader, address indexed positionAddr, uint256 orderSize);
    event PositionDecreased(uint256 indexed poolId, address indexed trader, address indexed positionAddr, uint256 orderSize);
    event PositionClosing(address indexed positionAddr);
    event PositionOverdrawn(address indexed positionAddr);
    event PositionClosed(address indexed positionAddr);
}
