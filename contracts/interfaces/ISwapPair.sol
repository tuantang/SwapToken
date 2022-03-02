// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

interface ISwapPair {

    function _factory() external view returns(address);
    function _token1() external view returns(address);
    function _token2() external view returns(address);
    function _kLast() external view returns(uint256);

    function initialize(address token1, address token2) external;
    function getReserves() external view returns(uint256 reserve1, uint256 reserve2, uint32 blockTimestampLast);
    function mint(address to) external returns (uint256 liquidity);
    function burn(address to) external returns (uint256 amount1, uint256 amount2);
    function swap(uint256 amount1Out, uint256 amount2Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;
}