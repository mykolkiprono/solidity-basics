// SPDX-License-Identifier: MIT


pragma solidity ^0.7.0;

contract one {
    bool m = true; // boolean values
    int a = -3; // ints including negatives
    uint b = 4; // positive ints
    address x = 0x98B429A6Ccb9d6bc6CD4B22e3420E9a241Aba6C2; // wallet addresses
    int8 c  = 2;
    int256 d = 9;
    // address myaddress = this;
    // if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);

    string name = "mike"; // string operations require more gas prefer bytes
    bytes32 name2 = "mike";

    bytes bstr = new bytes(10);
    string message = string(bstr); // Bytes to String Conversion

    // arrays
    uint[] balance = [1,2,3];  // dynamic
    uint[3] balance2 = [1,2,3]; // fixed

    //balance[2] = 5; // replace the 3rd value with 5
    // creating dynamic memory arrays
    uint size = 3;
    // uint balance3[] = new uint[](size);
    uint salary = balance[2]; // accessing an element of the array

    // uint[]  v = new uint[](7);
      //assert(v.length == 7);

// struct for custom data types
    struct Book {
        string title;
        string author;
        uint book_id;
    }

    Book book;

    function setBook() public {
        book = Book('animals', 'ben kdkd', 2);
    }
    
    function getBookId() public view returns(uint) {
        return book.book_id;
    }

    // enums restricted variables to have a few predefined values
    enum Sizes {
        SMALL,
        MEDIUM,
        LARGE
    }

    Sizes choice;
    Sizes constant defaultChoice = Sizes.MEDIUM;

    function setChoice() public {
        choice = Sizes.LARGE;
    }

    function getChoice() public view returns(Sizes){
        return choice;
    }

    function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
    }

    // mappings for mapping key value pairs
    mapping(address => uint) balances;

    function updateBalance(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }

}