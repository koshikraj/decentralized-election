pragma solidity >=0.4.0 < 0.6.0;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }


    enum Role {
        VOTER,
        CANDIDATE,
        COMMITTEE
    }

    modifier onlyCommitte {
        require(roles[msg.sender] == Role.COMMITTEE);
        _;
    }

    // Store the roles of actor
    mapping(address => Role) public roles;

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    event candidateAdded(
        string _name
    );

    constructor() public {
        roles[msg.sender] = Role.COMMITTEE;

    }

    function addCandidate (string memory _name) onlyCommitte public {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);

        // emit candidate added event
        emit candidateAdded(_name);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // emit voted event
        emit votedEvent(_candidateId);
    }
}
