pragma solidity 0.5.1;

contract MyContract {
    mapping(uint => Person) public people;
    uint256 public peopleCount = 0;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // epoch time
    // https://www.epochconverter.com/
    uint256 openingTime = 1997907792; 

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen {
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        incrementCount();
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}