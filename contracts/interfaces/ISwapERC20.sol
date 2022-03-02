// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

interface ISwapERC20 {

    // ERC20 standard
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    // Exention for Swap
    // Returns a domain separator for use in permit.
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    // Returns a typehash for use in permit.
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    // Returns the current nonce for an address for use in permit.
    function nonces(address owner) external view returns (uint256);

    // Sets the allowance for a spender where approval is granted via a signature.
    function permit(address owner, address spender, uint256 amount, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;
}