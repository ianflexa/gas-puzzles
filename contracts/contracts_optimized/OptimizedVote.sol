// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {
    uint8 private proposalNum;
    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        uint8 voteCount;
        bytes32 name;
        bool ended;
    }

    mapping(address => Voter) public voters;
    mapping (uint8 => Proposal) public proposals;

    function createProposal(bytes32 _name) external {
        proposals[proposalNum].name = _name;
        ++proposalNum;
    }

    function vote(uint8 _proposal) external {
        address voter = msg.sender;
        require(!voters[voter].voted, 'already voted');
        voters[voter] = Voter({vote: _proposal, voted: true});
        ++proposals[_proposal].voteCount;
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}
