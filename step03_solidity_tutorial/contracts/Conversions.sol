//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Conversions {
    // ***************************//
    // ******* Conversions *******//
    // ***************************//
    /* 
        Solidity allows implicit as well as explicit conversion.
        Implicit conversion is possible and there is no loss of information.
            Implicit consersion is the one where we convert from smaller data type to larger data type.
            explicit consersion is the one where we convert from larger data type to smaller data type.
    */

    // Implicit conversion
    function applyConversion() public pure returns (uint256) {
        uint8 a = 45;
        uint256 b = a;
        return b;
    }

    // Explicit conversion
    function applyConversion1() public pure returns (uint256) {
        uint256 a = 45;
        uint8 b = uint8(a);
        return b;
    }

    function applyConversion2() public pure returns (uint256) {
        uint256 a = 450;
        uint8 b = uint8(a);
        return b;
    }

    function applyConversion3() public pure returns (uint256) {
        int8 a = -3;
        uint8 b = uint8(a);
        return b;
    }

    /*
        // We can explicitly convert a data type to another using constructor syntax.
        // Conversion to smaller type costs higher order bits.
        // Conversion to higher type adds padding bits to the left.
        // Conversion to smaller byte costs higher order data.
        // Conversion to larger byte add padding bits to the right.
        // Conversion between fixed size bytes and int is only possible when both are of same size.
        // Hexadecimal numbers can be assigned to any integer type if no truncation is needed.
    */
}
