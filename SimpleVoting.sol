// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    // 候选人结构体
    struct Candidate {
        string name;
        uint voteCount;
    }

    // 候选人列表
    Candidate[] public candidates;

    // 记录是否已投票
    mapping(address => bool) public hasVoted;

    // 合约部署者
    address public owner;

    constructor(string[] memory candidateNames) {
        owner = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate(candidateNames[i], 0));
        }
    }

    // 投票函数
    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate index.");

        candidates[candidateIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    // 获取候选人数
    function getCandidatesCount() public view returns (uint) {
        return candidates.length;
    }

    // 获取候选人信息
    function getCandidate(uint index) public view returns (string memory name, uint voteCount) {
        require(index < candidates.length, "Invalid index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }
}

