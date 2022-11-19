/**
 * Data types is solidity can be classified into two types values and reference
 * Values means that the data stores the values, For example Boolean stores true or false, int stores number.
 * Reference types do not store the value, they store reference where the value is stored. 
 * For Ex: Array stores the reference of where the elements are stored.
 */

// SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract DataTypes {
  bool public status = true; // bool stores true or false
  uint public unsignedint = 123; // unit = uint256 0 to 2**256 - 1. unit type supports only numbers greater than 0
                                 //        unit8   0 to 2**8 - 1
                                 //        unit16  0 to 2**16 - 1
  int public i = -123; // int = int256 -2**255 to 2**255 - 1
                       //       int128 -2**127 to 2**127 - 1

  //To find the max and min value which can be stored on the data type 
  int public minInt = type(int).min;
  int public maxInt = type(int).max;
  uint public maxUint = type(uint).min;
  uint public minUint = type(uint).max;

  /* 
  * An address value type is specifically designed to hold up to 20B, or 160 bits, which is the size of an Ethereum address.
  * Solidity actually offers two address value types: address and address payable. 
  * The difference between the two is that address payable can send and transfer Ether.
  * We can use an address to acquire a balance using the .balance method and to transfer a balance using the .transfer method.
  */
  address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

  /*
  * In Solidity, byte refers to 8-bit signed integers. Everything in memory is stored in bits with binary values 0 and 1.
  * The bytes value type in Solidity is a dynamically sized byte array. It is provided for storing information in binary format. 
  * Since the array is dynamic, its length can grow or shrink.
  * To reflect this, Solidity provides a wide range — from bytes1 to bytes32. 
  * The data type bytes1 represents one byte, while bytes32 represents 32B. 0 x 00 is the default value for byte. 
  * This value is used to prepare the default value.
  */
  bytes1 public b1; // Default-value: 0x00
  bytes32 public b32; //Default-value: 0x0000000000000000000000000000000000000000000000000000000000000000

  /*
  * Enums are user defined data type.
  * This data type is used explicitly for constant values, such as the names of integral constants, making a smart contract easier to read and maintain. 
  * Enums can help reduce the incidence of bugs in your code.
  * Options are represented by integer values beginning with zero; you can also specify a default value for the enum.
  * It’s important to note that DApps do not recognize an enum within a smart contract.
  * An integer value that corresponds to the enum constant must be provided.
  */
  enum week_days
  {
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
  } 

  // Setting a default value
  week_days constant default_value = week_days.Sunday;
  // Setting other value
  week_days choice = week_days.Thursday;

  /**
  * Struct  in Solidity allows you to create more complicated data types that have multiple properties. You can define your own type by creating a struct.
  * Structs can be declared outside of a contract and imported in another contract. Generally, it is used to represent a record. 
  * To define a structure struct keyword is used, which creates a new data type.
  * For accessing any element of the structure, ‘dot operator’ is used, which separates the struct variable and the element we wish to access. 
  * To define the variable of structure data type structure name is used.
  */

  // Declaring a structure
  struct Book {
    string name;
    string writter;
    uint id;
    bool available;
  }

  // Assigning values to the fields for the structure object book2
  Book book1 = Book("Building Ethereum DApps", "Roberto Infante ", 2, false);
  // Defining function to print
  function get_details() public view returns (string memory, uint) {
    return (book1.name, book1.id);
  }
}