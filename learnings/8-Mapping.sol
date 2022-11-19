//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/* 
* Mapping are little bit similar to object literals in js. They store key value pair.
* Compare to array, mapping is much easier to reterive the value. disadvantage is it is not possible to iterate through mapping enteries
* 
* Mapping in Solidity acts like a hash table or dictionary in any other language. 
 These are used to store the data in the form of key-value pairs, a key can be any of the built-in data types but reference types are not allowed while the value can be of any type.
 Mappings are mostly used to associate the unique Ethereum address with the associated value type.
*/
contract Mapping {

  /* Syntax mapping(key => value) <access specifier> <name>; */

  //Defining structure
  // struct student 
  // {
  //     // Declaring different 
  //     // structure elements
  //     string name;
  //     string subject;
  //     uint8 marks;
  // }

  //  // Creating a mapping
  // mapping (address => student) result;
  // address[] public student_result; 



  mapping(address => uint) balances;

  /* Nested Mapping */
  mapping(address => mapping(address => bool)) approved;

  /* Array mapping */
  mapping(address => uint[]) scores;

  function mappingFunction(address spender) external {
    /** Adding data in mapping */
    balances[msg.sender] = 10;

    /** Updating data in mapping */
    balances[msg.sender] = 20;

    /** Reading data from mapp */
    balances[msg.sender];

    /** To delete */
    delete balances[msg.sender]; // This actually sets the default value of uint.

    /** Default value */
    balances[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4]; //If the key which does not exists, then the default value is retured;

    /** Exotic mapping */
    approved[msg.sender][spender] = true;

    /** Exotic mapping 2 */
    scores[msg.sender].push(1); //Here no need to  initate. we can directly call push;
    scores[msg.sender][0]; // to access 0th index element
    scores[msg.sender][0] = 2; //update
    delete [msg.sender][0]; //to delete 0th index element (sets default value)
  }


}