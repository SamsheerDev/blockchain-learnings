  /**
  * Struct  in Solidity allows you to create more complicated data types that have multiple properties. 
  You can define your own type by creating a struct.
  * Structs can be declared outside of a contract and imported in another contract. Generally, it is used to represent a record. 
  * To define a structure struct keyword is used, which creates a new data type.
  * For accessing any element of the structure, ‘dot operator’ is used, which separates the struct variable and the element we wish to access. 
  * To define the variable of structure data type structure name is used.
  */
  
//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract StructType {
  struct User {
    address addr;
    uint score;
    string name;
  }

  User[] userArray;

  //Way to add data in array struct. addr is unique
  mapping(address => User) userList2;

  function foo(string calldata _name) external {
    User memory user1 = User(msg.sender, 0, _name);
    User memory user2 = User({name:_name, score:0, addr:msg.sender});
    user2.addr;
    //Updating
    user2.score = 20;
    //Delete
    delete user1;

    //Adding values in array struct
    userArray.push(user1);
    userArray.push(User({name:_name, score:0, addr:msg.sender}));

    userList2[msg.sender] = user2;
  }

  function getValue() external view returns(User [] memory){
    return userArray;
  }
}