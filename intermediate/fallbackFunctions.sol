// // SPDX-License-Identifier: MIT


// pragma solidity ^0.7.0;

// contract Test {
//    uint public x ;
//    function() external { x = 1; }    
// }
// contract Sink {
//    function() receive external payable { }
// }
// contract Caller {
//    function callTest(Test test) public returns (bool) {
//       (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
//       require(success);
//       // test.x is now 1

//       address payable testPayable = address(uint160(address(test)));

//       // Sending ether to Test contract,
//       // the transfer will fail, i.e. this returns false here.
//       return (testPayable.send(2 ether));
//    }
//    function callSink(Sink sink) public returns (bool) {
//       address payable sinkPayable = address(sink);
//       return (sinkPayable.send(2 ether));
//    }
// }

pragma solidity ^0.7.0;

// Creating a contract
contract GeeksForGeeks
{
	// Declaring the state variable
	uint x;
	
	// Mapping of addresses to their balances
	mapping(address => uint) balance;

	// Creating a constructor
	constructor() public
	{
		// Set x to default
		// value of 10
		x=10;

	}

	// Creating a function
	function SetX(uint _x) public returns(bool)
	{
		// Set x to the
		// value sent
		x=_x;
		return true;
	}
	
	// This fallback function
	// will keep all the Ether
	function() public payable{

		balance[msg.sender] += msg.value;
	}
}

// Creating the sender contract
contract Sender
{
function transfer() public payable
{
	// Address of GeeksForGeeks contract
	address _receiver =	0xbcc0185441de06F0452D45AEd6Ad8b98017796fb;
				
	// Transfers 100 Eth to above contract		
	_receiver.transfer(100);
}
}
