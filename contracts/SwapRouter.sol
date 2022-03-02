// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./interfaces/ISwapRouter.sol";
import "./SwapFactory.sol";

contract SwapRouter is ISwapRouter {

    address public immutable override factory;

    constructor(address _factory) {
        factory = _factory;
    }

    function addLiquidity(
        address tokenA, 
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns(uint amountA, uint amountB, uint liquidity) {

    }

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity) {

    }

    function _addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin
    ) private returns (uint amountA, uint amountB) {
        if (SwapFactory(factory).getPair(tokenA, tokenB) == address(0)) {
            SwapFactory(factory).createPair(tokenA, tokenB);
        }
    }
}