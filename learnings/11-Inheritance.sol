//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
* Inheritance helps in reusing the code (thus reducing the duplicate code)
* virtual keyword in the function declartion defines that the function can be inherited in another smartcontract
* is keyword is used to inherite the smartcontract
* Parent function can be called directly or by using super keyword
*/

contract A {
  function foo() public pure virtual returns(string memory){
    return 'A';
  }

  function bar() public pure virtual returns(string memory){
    return 'A';
  }
  
  function baz() public pure virtual returns(string memory){
    return 'A';
  }
}


/** Contract B inherits A 
* override keyword is used to customize the inherited function.
*/
contract B is A {
  function foo() public pure virtual override returns(string memory){
    return 'B';
  }

  function bar() public pure virtual override returns(string memory){
    return 'B';
  }
}

contract C is B {
  function bar() public pure override returns(string memory){
    return 'C';
  }
}

/* For multiple inheritance, order must be most base like to derived 
* That is which smartcontract inherits less 
* If two smart contract has same inheritance number then we can order in any way
*/
contract Z is A, B {
  function foo() public pure override(A, B) returns(string memory){
    return 'Z';
  }

  function bar() public pure override(B, A) returns(string memory){
    return 'B';
  }
}
