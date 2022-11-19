//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/* Three ways to throw error require, revert, assert
* when ever error is thrown inside the transactions gas is refunded and state updates are reverted
* we can also use custom errors to save gas.
* When error is thrown if the gas fee is 1000 and 100 is used then 900 gas fee will be refunded and state variable data will be reverted
*/
contract Errors {

  /* require
  * It is mostly used to validate input and access control(controlling who gets to call the function)
  */
  function testRequire(uint _i) public pure {
    require(_i<=10, "i > 10"); //If i > 10 error is thrown
    //If passses next line of code will be executed;
  }

  /* revert
  * It is same as require
  * revert is checked inside the nested scope
  */
  function testRevert(uint _i) public pure {
    if(_i<=10){
      revert("i > 10"); //If i > 10 error is thrown
    }
    //If passses next line of code will be executed;
  }

  /* assert
  * It is used to check the condition that should always be true. 
  * If condition evaluates the false it means there is bug in smart contract code.
  */
  uint public num = 123;
  function testAssert() public view {
   assert(num == 123); // If num value is changed then it is a bug in smart contract
    //If passes next line of code will be executed;
  }

  /* custom error
  * custom error is used to save gas
  * Beneifit of using custom error is it is cheaper than require.
  * When using require, Longer the error message more gas is used, so to reduce this we can use custom error.
  * custom error can be used using revert only.
  */
  error MyError(string message);
  function testCustomError(uint _i) public pure {
    if(_i<=10){
      revert MyError("Loggeing the error here"); //If i > 10 error is thrown
    }
    //If passses next line of code will be executed;
  }
}