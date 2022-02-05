// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./tokenStandards/ERC20_Standard.sol";



contract ErcFactory{
    event TokenCreated (address indexed _tokenAddress);

    function createStandardToken(uint256 initialSupply, string memory name, string memory symbol)external returns(address TokenAddress){
        ERC20  newToken = new ERC20_Standard(msg.sender, initialSupply, name, symbol);
        emit TokenCreated(address(newToken));
        return address(newToken);
    }
}
