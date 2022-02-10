// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/ERC20Burnable.sol)

pragma solidity ^0.8.0;

import "./ERC20.sol";


contract ERC20_Burnable is ERC20{
     constructor(address Owner, uint256 initialSupply, string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(Owner, initialSupply);
    }

    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }




}
