//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Arrays {
  /* Array can store data of same type 
  * Two kinds storage array(stored on block) and memory array(store on memeory) */

  // uint[10] storageArray; //static array. push will not work in static array
  uint[] storageArray; //dynamic array

  function storageArrayFun() external {
    storageArray.push(100); //Add data to array
    storageArray[0]; // Read data by index from array
    storageArray[0] = 200; //Updated data on array by index

    /* delete data from array. delete resets the index value to default value of datatype. 
    * so if tried to access deleted array it will return default value
    * But if tried to access the index which not declared than it will throw errro
    */
    delete storageArray[0]; 

    for(uint i=0; i<storageArray.length; i++){
      storageArray[i];
    }
  }

  function memoryArrayFun() external pure {
    uint[] memory memoryArray = new uint[](10); // this is not stored in block. and it is fixed size array, push will not work on memory array.
    memoryArray[1] = 200; // assign value
    memoryArray[1]; //read
    memoryArray[1] = 300; // update value
    delete memoryArray[5]; //delete
  }
  uint public length;
  uint[] public num = [1,2,3,5];
  function examples() public {
    num.push(4); // [1,2,3,5,4];
    num[1]; // 2;
    delete num[1]; // [1,0,3,5,4];
    num.pop(); // [1,0,3, 5];
    num.length; // length of array = 4

    length = getLength(num);
  }

  function getLength(uint[] memory _arr) internal pure returns(uint){
    return _arr.length;
  }

  /*
  *Remove element by shifting arrays
  */
  function remove(uint _index) public {
    require(_index < num.length, "Index out of bound");
    for(uint i = _index; i< num.length; i++){
      num[i] = num[i+1];
    }
    num.pop();
  }

  /* Efficient way to remove the element in array*/
  function removeEle(uint _x) public {
    num[_x] = num[num.length - 1];
    num.pop();
  } 
  
}