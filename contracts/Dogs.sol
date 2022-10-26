// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "./Storage.sol";

contract Dog is Storage {

    modifier onlyOwner(){
        require(msg.sender==owner,"Can only be called by the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function getNumberofDogs() public view returns(uint256){
        return _uintStorage["Dogs"];
    }

    function setNumberofDogs(uint256 toSet) public{
        _uintStorage["Dogs"] = toSet;
    }
}