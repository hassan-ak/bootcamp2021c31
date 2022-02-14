//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Enums {
    // **************************//
    // ********* Enums *********//
    // **************************//
    /* 
        Enums restricts the values of the variable only from the predefined pool
        Strings can be used to define few things but they consume more space
        Enums stores variables in the numeric form
    */
    enum FreshJuiceSize {
        SMALL,
        MEDIUM,
        LARGE,
        EXTRALARGE
    }

    FreshJuiceSize juice = FreshJuiceSize.MEDIUM;

    function getJuice() public view returns (FreshJuiceSize) {
        return juice;
    }

    function updateJuiceSize(FreshJuiceSize _juice) public {
        juice = _juice;
    }

    function updateJuiceSizeError(uint256 _juice) public {
        require(_juice >= 0 && _juice <= 3, "Invalid Juice Size Selected");
        juice = FreshJuiceSize(_juice);
    }

    function verifyJuiceSize() public view returns (bool) {
        return juice == FreshJuiceSize.EXTRALARGE;
    }
}
