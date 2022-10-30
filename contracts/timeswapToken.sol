// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract timeswapToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("timeswapToken", "TIMESWAP") {}

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount * 10**decimals());
    }
}