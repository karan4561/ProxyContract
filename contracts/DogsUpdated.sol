// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "./Storage.sol";

contract DogUpdated is Storage {

    modifier onlyOwner(){
        require(msg.sender==owner,"Can only be called by the owner");
        _;
    }

    constructor() {
        initialize(msg.sender);
    }

    function initialize(address _owner) public{
        require(!_initialized);
        owner = _owner;
        _initialized = true;
    }

    function getNumberofDogs() public view returns(uint256){
        return _uintStorage["Dogs"];
    }

    function setNumberofDogs(uint256 toSet) public onlyOwner(){
        _uintStorage["Dogs"] = toSet;
    }
}