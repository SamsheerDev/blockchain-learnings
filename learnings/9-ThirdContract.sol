//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
* Interfaces are similar to abstract contracts and are created using interface keyword.
 Following are the key characteristics of an interface.

Interface can not have any function with implementation it has only signature.
Functions of an interface can be only of type external.
Interface can not have constructor.
Interface can not have state variables.
Interface can have enum, structs which can be accessed using interface name dot notation.
*/

interface InterfaceThirdContract {
  function test() external pure returns (string memory);

}
contract ThirdContract {
  function HelloWorld() external pure returns (string memory){
    return "Hello From Third Contract";
  }

  function test() external pure returns (string memory) {
    return "Hello From Third Contract from interface";
  }
}