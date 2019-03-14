pragma solidity >=0.4.22 <0.6.0;
contract VTF{
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    mapping(string => bool) private voted;
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    constructor () public {
        addCandidate("Modi");
        
        addCandidate("RaGa");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (string memory _pubkey, uint _candidateId) public {
        require(!voted[_pubkey]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voted[_pubkey] = true;
        candidates[_candidateId].voteCount ++;
    }

    function disp(uint _candidateId) view public returns (uint){
       require(_candidateId > 0 && _candidateId <= candidatesCount);
        return candidates[_candidateId].voteCount;
    }

}
