// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

library AllyLibrary {
    // Ally contracts
    bytes32 public constant AUCTION_HALL = keccak256("AUCTION_HALL");
    bytes32 public constant COMMITTEE = keccak256("COMMITTEE");
    bytes32 public constant DEX_CENTER = keccak256("DEX_CENTER");
    bytes32 public constant IPI_STR = keccak256("IPI_STR");
    bytes32 public constant PRICE_ORACLE = keccak256("PRICE_ORACLE");
    bytes32 public constant POOL_GUARDIAN = keccak256("POOL_GUARDIAN");
    bytes32 public constant SAVIOR_ADDRESS = keccak256("SAVIOR_ADDRESS");
    bytes32 public constant STATE_ARCADE = keccak256("STATE_ARCADE");
    bytes32 public constant TRADING_HUB = keccak256("TRADING_HUB");
    bytes32 public constant VAULT_BUTLER = keccak256("VAULT_BUTLER");
    bytes32 public constant TREASURY = keccak256("TREASURY");
    bytes32 public constant SHORTER_FACTORY = keccak256("SHORTER_FACTORY");
    bytes32 public constant FARMING = keccak256("FARMING");
    bytes32 public constant POSITION_OPERATOR = keccak256("POSITION_OPERATOR");
    bytes32 public constant STR_TOKEN_IMPL = keccak256("STR_TOKEN_IMPL");
    bytes32 public constant SHORTER_BONE = keccak256("SHORTER_BONE");
    bytes32 public constant BRIDGANT = keccak256("BRIDGANT");

    // Models
    bytes32 public constant FARMING_REWARD = keccak256("FARMING_REWARD");
    bytes32 public constant POOL_REWARD = keccak256("POOL_REWARD");
    bytes32 public constant VOTE_REWARD = keccak256("VOTE_REWARD");
    bytes32 public constant GOV_REWARD = keccak256("GOV_REWARD");
    bytes32 public constant TRADING_REWARD = keccak256("TRADING_REWARD");
    bytes32 public constant GRAB_REWARD = keccak256("GRAB_REWARD");
}
