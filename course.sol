pragma solidity ^0.4.18;

import "./Owned.sol";

contract Courses is Owned {
    
    struct Instructor {
        uint age;
        bytes16 fname;
        bytes16 lname;
    }
    
    mapping(address => Instructor) instructors;
    address[] public instructorAccts;
    
    event instructorInfo(
       bytes16 fName,
       bytes16 lName,
       uint age
    );
    
    function setInstructor(address _address, uint _age, bytes16 _fname, bytes16 _lname) onlyOwner public {
        var instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fname = _fname;
        instructor.lname = _lname;
        
        instructorAccts.push(_address) -1;
        instructorInfo(_fname, _lname, _age);
    }
    
    function getInstructors() view public returns (address[]) {
        return instructorAccts;
    }
    
    function getInstructor(address ins) view public returns (uint, bytes16, bytes16) {
        return (instructors[ins].age, instructors[ins].fname, instructors[ins].lname);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    
}
