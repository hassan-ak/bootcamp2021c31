//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract EtherUnits {
    // ***************************//
    // ******* Ether Units *******//
    // ***************************//
    /*
        In solidity we can use wei, finney, szabo or ether 
        as a suffix to a literal to be used to convert 
        various ether based denominations. 
        Lowest unit is wei and 1e12.
     */

    assert(1 wei == 1);
    assert(1 szabo == 1e12);
    assert(1 finney == 1e15);
    assert(1 ether == 1e18);
    assert(2 ether == 2000 fenny);

    // Ether
    uint256 amount = 1 ether;
    uint256 amount = 1_000_000_000_000_000_000;
    uint256 amount = 1e18;

    // Time
    assert(1 seconds == 1);
    assert(1 minutes == 60 seconds);
    assert(1 hours == 60 minutes);
    assert(1 day == 24 hours);
    assert(1 week == 7 days);
}
