//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SpecialVariables {
    // *********************************//
    // ******* Special Variables *******//
    // *********************************//
    /*
        blockhash(uint blockNumber) returns (bytes32) --- Hash of the given block - only works for 256 most recent, excluding current, blocks.
        block.coinbase (address payable) --- Current block miner's address.
        block.difficulty (uint) --- current block difficulty.
        block.gaslimit (uint) --- Current block gaslimit.
        block.number (uint) --- Current block number.
        block.timestamp --- Current block timestamp as seconds since unix epoch.
        gasleft() returns (uint256) --- Remaining gas.
        msg.data (bytes calldata) --- Complete calldata.
        msg.sender (address payable) --- Sender of the message (current call).
        msg.sig (bytes4) --- First four bytes of the calldata (i.e. function identifier)
        msg.value (uint) --- Number of wei sent with the message.
        now (uint) --- Current block timestamp (alias for block.timestamp).
        tx.gasprice (uint) --- Gas price of the transaction.
        tx.origin (address payable) --- Sender of the transaction (full call chain).
     */
}

contract LedgerBalance {
    mapping(address => uint256) public balances;

    function updateBalance(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract Updater {
    function updateBalance() public returns (uint256) {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updateBalance(10);
        return ledgerBalance.balances(address(this));
    }
}
