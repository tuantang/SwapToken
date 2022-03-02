// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./libraries/Math.sol";
import "./interfaces/ISwapPair.sol";
import "./interfaces/ISwapFactory.sol";
import "./SwapERC20.sol";

contract SwapPair is ISwapPair, SwapERC20 {

    using SafeMath for uint;

    address public _factory;
    address public _token1;
    address public _token2;

    uint256 private _reserve1;
    uint256 private _reserve2;
    uint32  private _blockTimestampLast;

    uint256 public _kLast;

    bool private unlocked = true;

    constructor () {
        _factory = msg.sender;
    }

    modifier lock() {
        require(unlocked, 'SwapPair: Locked');
        unlocked = false;
        _;
        unlocked = true;
    }

    function initialize(address token1, address token2) external {
        require(msg.sender == _factory, 'SwapPair: not factory');
        _token1 = token1;
        _token2 = token2;
    }

    function getReserves() public view returns (uint256 reserve1, uint256 reserve2, uint32 blockTimestampLast) {
        reserve1 = _reserve1;
        reserve2 = _reserve2;
        blockTimestampLast = _blockTimestampLast;
    }

    function mint(address to) external lock returns (uint256 liquidity) {
        (uint256 reserve1, uint256 reserve2,) = getReserves();
        uint256 balance1 = IERC20(_token1).balanceOf(address(this));
        uint256 balance2 = IERC20(_token2).balanceOf(address(this));
        uint256 amount1 = balance1.sub(_reserve1);
        uint256 amount2 = balance2.sub(_reserve2);

        bool feeOn = _mintFee(reserve1, reserve2);
    }

    function burn(address to) external lock returns (uint256 amount1, uint256 amount2) {
        
    }

    function swap(uint256 amount1Out, uint256 amount2Out, address to, bytes calldata data) external lock {

    }

    function skim(address to) external lock {

    }

    function sync() external lock {

    }

    function _mintFee(uint256 reserve1, uint256 reserve2) private returns (bool feeOn) {
        address feeTo = ISwapFactory(_factory).feeTo();
        feeOn = feeTo != address(0);
        uint kLast = _kLast;
        if (feeOn) {
            if (kLast != 0) {
                uint256 rootK = Math.sqrt(reserve1.mul(reserve2));
                uint256 rootKLast = Math.sqrt(kLast);
                if (rootK > rootKLast) {
                    uint numerator = totalSupply.mul(rootK.sub(rootKLast));
                    uint denominator = rootK.mul(5).add(rootKLast);
                    uint liquidity = numerator / denominator;
                    if (liquidity > 0) _mint(feeTo, liquidity);
                } 
            } 
        } else if (kLast != 0) {
            _kLast = 0;
        }
    }
}