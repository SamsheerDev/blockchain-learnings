//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/**
There are four data locations
Storage
memory
stack
calldata
*/
contract MemoryLocation {

  /*
  * storage means that the variable is stored in blockchain, it can be find later as well 
  * Whenever the state variable is declared(that is outside function). This has memory location storage
  * Does need to specify storage for storage variable
  */
  uint a;
  /* We need to use storage keyword when we create a pointers to deeply nested data */
  struct User{
    string name;
  }
  User[] users;
  function pointerToUsers() external {
    User storage  user = users[0]; //Here user is a pointer and storage keyword is used to create it
    user.name = "Some name";
  }

  /* 
  * memory
  * It is not stored in blockchain, it only keps in memory during execution of the function and destroyed;
  * This does not affect the users array stored in the state. It is a copy and gets destroyed once the function execution is completed
  */
  function memoryLoc() external view {
    User memory user = users[1]; 
    user.name = "Memory name";
  }

  /*
  * stack
  * every variable created within function is created on stack
  */
  function stackVariable() public pure returns(uint) {
   uint b;
   return b;
  }

  /*
  * calldata
  * This memory location is avilable only for functions that are either external or public. 
  * When the array is accpeted in the function from transaction then its location is calldata
  * It is like memoery except it can be used as function inputs only
  */
  function callDataEx(uint[] calldata _exa) external pure returns(uint) {
   uint b = _exa[0];
   return b;
  }
}