// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

interface ISwapRouter {
    
    function factory() external view returns(address);

    function addLiquidity(
        address tokenA, 
        address tokenB, 
        uint256 amountADesired, 
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns(uint256 amountA, uint256 amountB, uint256 liquidity);

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
}