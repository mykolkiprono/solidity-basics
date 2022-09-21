// SPDX-License-Identifier: MIT


pragma solidity ^0.7.0;

contract SolidityTest {
   uint storedData;      // State variable

   constructor()  {
      storedData = 10;   // Using State variable
   }

   function getResult() public view returns(uint) {
    // uint a = 2;
    // uint b = 5;
    //uint result = a+b;
    return storedData; // accessing state variable
   }

//    global variables
    function globalVariable() public view {
        block.coinbase; // current block miners address
        block.difficulty; // current block difficulty
        block.gaslimit; // current block gas limit
        block.number;// current block number
        block.timestamp; // current block timestamp
        //msg.data; // complete calldata only used in payable public functions
       // msg.value; // number of wei ent with the message only used in payable public functions
        //now(); // current block timestamp
        tx.gasprice; // transaction gas price
        tx.origin; // sender of the transaction

    }
}