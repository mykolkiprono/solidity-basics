// SPDX-License-Identifier: MIT

// Solidity program to demonstrate
// DApps

pragma solidity ^0.7.0;

// Smart Contract for the Voting application
contract VotingForTopper {

	// Refer to the owner
	address owner;

	// Declaring the public variable 'purpose'
	// to demonstrate the purpose of voting
	string public purpose;
	
	// Defining a structure with boolean
	// variables authorized and voted
	struct Voter{
		bool authorized;
		bool voted;
	}

	// Declaring the unsigned integer
	// variables totalVotes, and for the
	//3 teams- A,B, and C
	uint totalVotes;
	uint teamA;
	uint teamB;
	uint teamC;
	
	// Creating a mapping for the total Votes
	mapping(address=>Voter) info;

	// Defining a constructor indicating
	// the purpose of voting
	constructor(
	string memory _name){
		purpose = _name;
		owner = msg.sender;
	}
	
	// Defining a modifier to
	// verify the ownership
	modifier ownerOn() {
		require(msg.sender==owner);
		_;
	}
	
	// Defining a function to verify
	// the person is voted or not
	function authorize(
	address _person) ownerOn public {
		info[_person].authorized= true;
		
	}
	
	// Defining a function to check and
	// skip the code if the person is already
	// voted else allow to vote and
	// calculate totalvotes for team A
	function temaAF(address _address) public {
		require(
		!info[_address].voted,
		"already voted person");
		require(
		info[_address].authorized,
		"You Have No Right for Vote");
		info[_address].voted = true;
		teamA++;
		totalVotes++;
	}

	// Defining a function to check
	// and skip the code if the person
	// is already voted else allow to vote
	// and calculate totalvotes for team B
	function temaBF(address _address) public {
	require(
	!info[_address].voted,
	"already voted person");
		require(
		info[_address].authorized,
		"You Have No Right for Vote");
		teamB++;
		info[_address].voted = true;
		totalVotes++;
	}

	// Defining a function to check
	// and skip the code if the person
	// is already voted else allow to vote
	// and calculate totalvotes for team C
	function temaCF(address _address) public returns(
	string memory){
		require(
		!info[_address].voted,
		"already voted person");
		require(
		info[_address].authorized,
		"You Have No Right for Vote");
		info[_address].voted = true;
		teamC++;
		totalVotes++;
		return("Thanks for Voting");
	}

	function totalVotesF() public view returns(uint){
		return totalVotes;
	}

	// Defining a function to announce
	// the result of voting and
	// the name of the winning team
	function resultOfVoting() public view returns(
	string memory message){
		if(teamA>teamB){
			if(teamA>teamC){
				message = "A is Winning";
                return message;
			}
			else if(teamC>teamA){
				message =  "C is Winning"; 
                return message;} }
                
		else if(teamB>teamC) {
			message = "B is Winning";
            return message;
		}
		else if(
		teamA==teamB && teamA==teamC || teamB==teamC ){
			message = "No One is Winning";
            return message;
		}
	}
	}
