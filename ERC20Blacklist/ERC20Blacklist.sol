//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface ERC20Interface {
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function totalSupply() external view returns (uint256);
  function balanceOf(address _owner) external view returns (uint256 balance);
  function transfer(address _to, uint256 _value) external returns (bool success);
}

library ERC20Lib {
  function convertBalance(uint256 _balance, uint256 _decimalVal ) internal pure returns (uint256){
    return _balance / 10**_decimalVal;
  }

    function convertValue(uint256 _value, uint256 _decimalVal ) internal pure returns (uint256){
    return _value * 10**_decimalVal;
  }
}

contract ERC20 is ERC20Interface {

  mapping(address => uint256) private _balances;
  mapping(address => bool) private _blacklisted;

  uint256 private _totalSupply;
  uint256 private _decimals;
  string private _name;
  string private _symbol;

  constructor(){
    _name = 'ERC20 Token';
    _symbol = 'ERC-TK';
    _decimals = 18;
    _totalSupply = 1000000000000000000000000; // 10 Lakh tokens
    _balances[msg.sender] = _totalSupply; // All tokens is assigned to contract deployer
  }

  /* Returns the name of the Token */
  function name() public view virtual override returns (string memory) {
    return _name;
  }

  /* Returns the symbol of the token */
  function symbol() public view virtual override returns (string memory) {
    return _symbol;
  }  

  /* Returns the total supply of the token */
  function totalSupply() public view virtual override returns (uint256) {
    return _totalSupply;
  }  

  /* Returns balance of given address */
  function balanceOf(address account) public view virtual override returns (uint256) {
    if(_blacklisted[account]){
      return 0;
    }
    return ERC20Lib.convertBalance(_balances[account], _decimals );
  }

  /* Blacklists the given address */
  function blackList(address account) external {
    _blacklisted[account] = true;
  }

  /* Removes the account from blacklist */
  function removeBlackList(address account) external {
    _blacklisted[account] = false;
  }

  /* Transfers balance from sender to receiver */
  function transfer(address _to, uint256 _value) external returns (bool success){

    /* if given value is negative number or balance is less than what sender holds, false is thrown */
    if(_value < 0 ||  ERC20Lib.convertBalance(_balances[msg.sender], _decimals ) < _value){
      return false;
    }

    _balances[msg.sender] -= ERC20Lib.convertValue(_value, _decimals); // sender balance is reduced
    _balances[_to] += ERC20Lib.convertValue(_value, _decimals); // receiver balance is increased

    return true;
  }
}