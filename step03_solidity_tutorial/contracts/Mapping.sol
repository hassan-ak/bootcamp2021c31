//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Mapping {
    // ***************************//
    // ********* Mapping *********//
    // ***************************//
    /*
        Mapping is a reference type as arrays and structs
        mapping(_KeyType => _ValueType)
            _KeyType − can be any built-in types plus bytes and string. No reference type or complex objects are allowed.
            _ValueType − can be any type.
        Mapping can only have type of storage and are generally used for state variables.
        Mapping can be marked public. Solidity automatically create getter for it.
     */

    enum FundingRound {
        SEED,
        PRIVATE,
        PUBLIC
    }

    struct FundingRoundDetails {
        uint256 fundingRequired;
        FundingRound round;
    }

    mapping(uint256 => FundingRoundDetails) public fundingRounds;
    mapping(address => FundingRoundDetails) public userRounds;
    mapping(address=>mapping(uint256->bool)) someMapping;
    uint256 roundCounter;

    struct UserInfo {
        string name;
        uint256 age;
        mapping(address => uint256) fundingRecieved;
    }

    mapping(address => UserInfo) users;

    function addUser(string memory _name, uint256 _age) public {
        // UserInfo memory _user = UserInfo("Hassan Ali Khan", 28);
        UserInfo storage _user = users[msg.sender];
        _user.name = _name;
        _user.age = _age;
    }

    function provideFunding(address _user, uint256 _amount) public {
        UserInfo storage _userInfo = users[_user];
        _userInfo.fundingRecieved[msg.sender] = _amount;
    }

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

        fundingRounds[++roundCounter] = details1;
        fundingRounds[++roundCounter] = details2;
        fundingRounds[++roundCounter] = details3;
    }

    function addRound(uint256 amount, uint256 round) public {
        roundCounter++;
        fundingRounds[roundCounter] = FundingRoundDetails(
            amount,
            FundingRound(round)
        );
        userRounds[msg.sender] = FundingRoundDetails(
            amount,
            FundingRound(round)
        );
    }

    function getMyRoundInfo() public view returns (FundingRoundDetails memory) {
        return userRounds[msg.sender];
    }
}
