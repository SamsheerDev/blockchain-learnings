//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/**
* Events allow to write data on blockchain, these data can not later be reterived by smartcontract
* Main purpose of events to log if something happens, it can be achived alternative to storing data as a state variable
* If the data is something want to store on blockchain once and later smart contract does not have to reterive it
*/

contract Events {
  event Log(string message, uint val);
  event IndexedLog(address indexed sender, uint val);

  function example() external { // It is a transactional function since we write data on block chain
    emit Log("Foo",124); 
    emit IndexedLog(msg.sender, 789);
  }

  event Message(address indexed _from, address indexed _to, string message);

  function sendMessage(address _to, string calldata message) external {
    emit Message(msg.sender, _to, message);
  }
}