// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolidityTest {
    constructor() {
        // 构造函数可以不写 public，从 0.7.0 开始已废弃构造函数可见性
    }

    function getResult() public pure returns (uint) {
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }
}

