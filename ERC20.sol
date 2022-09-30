//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


/** This six  function is mandatory to be implemented in order to make a contract as ERC20 standard.
totalSupply()
balanceOf(account)
transfer(to, amount)
allowance(owner, spender)
approve(spender, amount)
transferFrom(from, to, amount) 
*/
interface ERC20Interface {
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function totalSupply() external view returns (uint256);
  function decimals() external view returns (uint8);
  function balanceOf(address _owner) external view returns (uint256 balance);
  function transfer(address _to, uint256 _value) external returns (bool success);
  function allowance(address _owner, address _spender) external returns (uint256);
  function approve(address _spender, uint256 _value) external returns (bool success);
  function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}

// library ERC20Lib {
//   function convertBalance(uint256 _balance, uint256 _decimalVal ) internal pure returns (uint256){
//     return _balance / 10**_decimalVal;
//   }

//     function convertValue(uint256 _value, uint256 _decimalVal ) internal pure returns (uint256){
//     return _value * 10**_decimalVal;
//   }
// }

contract ERC20 is ERC20Interface {

  mapping(address => uint256) private _balances;
  mapping(address => bool) private _blacklisted;
  /* owner => spender => amount */
  mapping(address => mapping(address => uint256)) private _approved;

  uint256 private _totalSupply;
  uint8 private _decimals;
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

  function decimals() public view virtual override returns (uint8) {
    return _decimals;
  }

  /* Returns balance of given address */
  function balanceOf(address account) public view virtual override returns (uint256) {
    if(_blacklisted[account]){
      return 0;
    }
    return _balances[account];
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
    if(_value < 0 ||  _balances[msg.sender] < _value){
      return false;
    }

    _balances[msg.sender] -= _value; // sender balance is reduced
    _balances[_to] += _value; // receiver balance is increased
    // emit Transfer(msg.sender, _to, _value +" transfer from "+msg.sender+" to "+_to);
    emit Transfer(msg.sender, _to, "Tranfered");
    return true;
  }

  /* Returns the amount, how much the owner can spend on behalf of spender address */
  function allowance(address _owner, address _spender) public view virtual override returns (uint256) {
    return _approved[_owner][_spender];
  }

  /* The owner approves how much the spender(other account address) can do the transfers */
  function approve(address _spender, uint256 _value) external returns (bool success){
    _approved[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, "Tranfered");
    return true;
  }

  /* The spender transfers the amount from owner to 'to' address based on the approved amount by the owner */
  function transferFrom(address _from, address _to, uint256 _value) external returns (bool success){
    uint256 allowedBalance = _approved[_from][msg.sender]; //msg.sender is the spender who calls this function. _from is the owner
    /* check if the value is allowed to spend from 'from' address*/
    if(allowedBalance <= _value){
      return false;
    }
    /* check if from has enough balance */
    if(_balances[_from] <= _value ){
      return false;
    }
    /* transafer to _to address */
    _approved[_from][msg.sender] -= _value; //reduced from approved amount;
    _balances[_from] -= _value; // reduced balance from owner;
    _balances[_to] += _value; // added balance to 'toAddress';
    emit Transfer(msg.sender, _to, "Tranfered");
    return true;
  }

  /* Transfer event is emited when trnfer happen */
  event Transfer(address indexed _from, address indexed _to, string message);
  /* This event is emitted when amount is assgigned to the spender by the ownner */
  event Approval(address indexed _from, address indexed _to, string message);

}