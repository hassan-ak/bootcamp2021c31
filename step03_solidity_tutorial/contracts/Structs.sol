//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Structs {
    // ***************************//
    // ********* Structs *********//
    // ***************************//
    /* 
        Struct types are used to represent a record.
        The struct keyword defines a new data type, with more than one member
    */

    /* Example One*/
    struct Book {
        string title;
        string author;
        uint256 book_id;
    }

    Book book;

    function setBook() public {
        book = Book("Learn Java", "TP", 1);
    }

    function getBookId() public view returns (uint256) {
        return book.book_id;
    }

    /* Example Two*/
    enum FundingRound {
        SEED,
        PRIVATE,
        PUBLIC
    }

    struct FundingRoundDetails {
        uint256 fundingRequired;
        FundingRound round;
    }

    FundingRoundDetails[] public allRounds;

    function addFundingRound() public {
        FundingRoundDetails memory details1 = FundingRoundDetails(
            10000,
            FundingRound.SEED
        );
        FundingRoundDetails memory details2 = FundingRoundDetails(
            20000,
            FundingRound.PRIVATE
        );
        FundingRoundDetails memory details3 = FundingRoundDetails(
            30000,
            FundingRound.PUBLIC
        );
        allRounds.push(details1);
        allRounds.push(details2);
        allRounds.push(details3);
    }

    function getRequiredFundingForRound(uint256 _roundNumber)
        public
        view
        returns (uint256)
    {
        return allRounds[_roundNumber].fundingRequired;
    }
}
