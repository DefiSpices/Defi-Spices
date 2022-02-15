// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./tokenStandards/ERC20_Standard.sol";
import "./tokenStandards/ERC20_Burnable.sol";
import "./tokenStandards/ERC20_Mintable.sol";
import "./tokenStandards/ERC20_Capped.sol";


contract ErcFactory{
    event TokenCreated (address indexed _tokenAddress);

    function createStandardToken(uint256 initialSupply, string memory name, string memory symbol)external returns(address TokenAddress){
        ERC20  newToken = new ERC20_Standard(msg.sender, initialSupply, name, symbol);
        emit TokenCreated(address(newToken));
        return address(newToken);
    }
    function createBurnableToken(uint256 initialSupply, string memory name, string memory symbol)external returns(address TokenAddress){
        ERC20  newToken = new ERC20_Burnable(msg.sender, initialSupply, name, symbol);
        emit TokenCreated(address(newToken));
        return address(newToken);
    }

    function createMintableToken(uint256 initialSupply, string memory name, string memory symbol)external returns(address){
    ERC20_Mintable newToken = new ERC20_Mintable(msg.sender, initialSupply, name, symbol);
    emit TokenCreated(address(newToken));

    return address(newToken);
  }
  function createCappedToken(uint256 initialSupply, string memory name, string memory symbol, uint256 _cap)external returns(address){
  ERC20_Capped newToken = new ERC20_Capped(msg.sender, initialSupply, name, symbol, _cap);
  emit TokenCreated(address(newToken));

  return address(newToken);
}
}
