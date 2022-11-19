//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
* Library
* It allows to seprate and use the code and also allows to enhance the data types
* library keyword is used to create a Library
* State variable can not  be declared inside the library
* library functions are internal or public (diff is if declared public then library needs to deployed first and then smartcontract)
* If decalred internal then it will be deployed when smartcontract is dellpoyed.
*/
library ArrayLib {
  function find(uint[] storage _arr, uint _x ) internal view returns (uint){
    for(uint i=0; i< _arr.length; i++){
      if(_arr[i] == _x){
        return i;
      }
    }
    revert("Value not found");
  }
}

contract Library {
  using ArrayLib for uint[]; // It defines to attach all the functionality defined for dataType uint array

  uint[] public arr = [1,2,3,4,5];

  function findIndex() external view returns(uint i) {
    // return ArrayLib.find(arr, 2); // This calls find function from array library by passing the state variable and value to find
    return arr.find(5); // This function is called on ArrayLib for arr datatype(uint[])
  }
}