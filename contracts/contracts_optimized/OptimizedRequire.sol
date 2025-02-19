// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

error InvalidAmount();

contract OptimizedRequire {
    // Do not modify these variables
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime;

    // Optimize this function
    function purchaseToken() external payable {
        if (msg.value != 0.1 ether) revert InvalidAmount();
        unchecked {
            require(
                block.timestamp - COOLDOWN > lastPurchaseTime,
                'cannot purchase'
            );
        }
        lastPurchaseTime = block.timestamp;
    }
}
