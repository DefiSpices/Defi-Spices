// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract ERC20_Standard is ERC20 {
    constructor(address Owner, uint256 initialSupply, string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(Owner, initialSupply);
    }
}
