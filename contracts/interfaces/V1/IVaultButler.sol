// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IVaultButler {
    function priceOfLegacy(address position) external view returns (uint256);

    function executeNaginata(address position, uint256 bidSize) external;

    function legacyInfos(address position) external view returns (uint256 bidSize, uint256 usedCash);

    // Events
    event ExecuteNaginata(address indexed positionAddr, address indexed ruler, uint256 bidSize, uint256 receiveSize);
}
