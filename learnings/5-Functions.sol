//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
* Function Behaviour: pure, view, payable
*/
contract FunctionBehaviour {
  /* Following statement considered as modifying the state
  * Writing to state variable
  * Emmiting events
  * creating other contracts
  * use selfdestruct
  * sending ether via calls
  * calling any function not marked as view or pure
  * using low-level calls
  * using inline assembly that contains certain opcodes
  */
  uint public c = 2;

  /*
  * View functions can not modify the states
  * Here in view function state vaiable is used but it is not modified
  */
  function addToX(uint d) public view returns(uint){
    return c + d;
  }
  /* This error is thrown when tried to modify the state from view
  * TypeError: Function cannot be declared as view because this expression (potentially) modifies the state.
  */
  // function updateX(uint d) public view returns(uint){
  //   return c = d;
  // }

  /*
  Following are considered as reading from state:
  * Reading state variable
  * Accessing address(this).balance or <address>.balance
  * Accessing any of the member from block, txt, msg
  * Calling any function not marked as pure
  * using inline assembly that contains certain opcodes
  */
  /*
  * Pure functions also does not modify the state but also can not read the state variable
  * pure function can not contain any code from reading the state points
  */
  function addTwo(uint i, uint j) public pure returns(uint){
    return i + j;
  }


  /*Payable
  * contracts can send and receive ether by using keyword payable
  */
  address payable public owner;
  function deposit() external payable {}

  constructor(){
    owner = payable(msg.sender); // Here msg.sender is casted as payable address;
  }

  function getBalance() external view returns (uint){
    return address(this).balance;
  }


}

/* Function Visibilt :  External, Internal, private and public *, by default internal/
/* It defines who can have access to the function */
contract FunctionVisibility {
  /*
  * With Private one can call the function from inside the smartcontract 
  * in general function name is prefixed with _ to differentiate that it is a private function
  */
  uint value = 1203;
  function _getPrivateData() private view returns(uint) {
    return value;
  }

  /* With internal funtion is limited to be called within the smart contract, and also it can be called from inherited smartcontract */
  function _getInternalData() internal view returns(uint) {
    return value;
  }

  /* External function can only be called from outside the smartcontract
  using this keyword it can be called within smartcontract(but it is gas inefficeint) */
  function getExternalData() external view returns(uint) {
    return value;
  }

  /* With public function can be called from outside and inside the smartcontract */
  function getPublicData() public view returns(uint) {
    return value;
  }

}


/* 
* Function modifier 
* Function Modifiers are used to modify the behaviour of a function
* The function body is inserted where the special symbol "_;" appears in the definition of a modifier. 
* So if condition of modifier is satisfied while calling this function, the function is executed and otherwise, an exception is thrown.
*/
contract FunctionModifier {
  address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
  // address owner = msg.sender;
  uint price;
  modifier onlyOwner {
      require(msg.sender == owner);
      _; //Here the updatePrice is executed
  }
  function updatePrice (uint _price) public onlyOwner {
    price = _price;
  }

  function getValue() external view returns(uint){
    return price;
  }
}

contract FallBack {
  /* Fallback is a special function which executed when the function called does not exist in smart contract
  Main use cases is to enable direct sending ether */

  /*
      FallBack or Receive
                    Ether is sent to contract
                              |
                      is msg.data empty?
                          |       |
                        yes      No
                        |         |
          receive() exists?      fallback()
             |       |
            Yes     No
            |         |
        receive()   fallback()
  */      
  fallback() external payable  {} //Payable to enable receive ether

  receive() external payable  {}

}