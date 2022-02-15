// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";

contract ERC20_Capped is ERC20{
    address public Owner;
    uint256 cap;

    modifier onlyOwner(){
        require(msg.sender == Owner, "only Owner");
        _;
    }
    constructor(address owner, uint256 initialSupply, string memory name, string memory symbol, uint256 _cap) ERC20(name, symbol) {
        require(_cap > 0, "ERC20Capped: cap is 0");
        cap = _cap;
        Owner = owner;
        _mint(owner, initialSupply);
    }
    function mint(uint256 amount) public virtual onlyOwner{
        require(totalSupply() + amount <= cap, "ERC20Capped: cap exceeded");

        _mint(_msgSender(), amount);
    }

}
