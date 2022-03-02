// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./interfaces/ISwapFactory.sol";

contract SwapFactory is ISwapFactory {
    
    address public feeTo;

    mapping(address => mapping(address => address)) public getPair;

    function createPair(address tokenA, address tokenB) external returns (address pair) { 
        require(tokenA != tokenB, 'Swap: IDENTICAL_ADDRESSES');
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'Swap: ZERO_ADDRESS');
        require(getPair[token0][token1] == address(0), 'Swap: PAIR_EXISTS');
    }
}