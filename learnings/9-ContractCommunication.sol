//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import '9-ThirdContract.sol';

contract FirstContract {
  address secondContractAddr;
  address ThirdContractAddr;


  function setContractAddress(address _secAddress,  address _thirdAddress) external {
    secondContractAddr = _secAddress;
    ThirdContractAddr = _thirdAddress;
  }

  function callSecondContractFunction() external view returns (string memory){

    /** Reference another contract but same file */
    SecondContract secContract = SecondContract(secondContractAddr); 
    secContract.HelloWorld();

    /** Reference another contract from different file */
    ThirdContract thirdContract = ThirdContract(ThirdContractAddr); 
    thirdContract.HelloWorld();

    /** We can use interface */
    InterfaceThirdContract ithirdContract = InterfaceThirdContract(ThirdContractAddr); 
    return ithirdContract.test();


  }
}


contract SecondContract {
  function HelloWorld() external pure returns (string memory){
    return "Hello From Second Contract";
  }
}
