// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract ERC20Zeplin is ERC20 {
  
  uint256 private _totalSupply;
  mapping(address => bool) private _blacklisted;

  constructor() ERC20("ERC20-Zeplin", "ERCZEP-TK") {
    _totalSupply = 1000000000000000000000000; // 10 Lakh tokens
    _mint(msg.sender, _totalSupply);
  }

  /* Returns balance of given address */
  function balanceOf(address account) public view virtual override returns (uint256) {
    if(_blacklisted[account]){
      return 0;
    }
    return super.balanceOf(account);
  }

  /* Blacklists the given address */
  function blackList(address account) external {
    _blacklisted[account] = true;
  }

  /* Removes the account from blacklist */
  function removeBlackList(address account) external {
    _blacklisted[account] = false;
  }
}