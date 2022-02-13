// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";

contract ERC20_Mintable is ERC20{
    address public Owner;

    modifier onlyOwner(){
        require(msg.sender == Owner, "only Owner");
        _;
    }
    constructor(address owner, uint256 initialSupply, string memory name, string memory symbol) ERC20(name, symbol) {
        Owner = owner;
        _mint(owner, initialSupply);
    }
    function mint(uint256 amount) public virtual onlyOwner{
        _mint(_msgSender(), amount);
    }

}
