pragma solidity ^0.8.0;

contract DNS {
    
    // Struct to hold domain information
    struct Domain {
        string name;
        address owner;
        string ip;
    }
    
    // Mapping of domains to their corresponding Domain structs
    mapping(string => Domain) public domains;
    
    // Events for domain registration and update
    event NewDomainRegistered(string name, address owner, string ip);
    event DomainUpdated(string name, address owner, string ip);
    
    // Function to register a new domain
    function registerDomain(string memory name, string memory ip) public {
        require(domains[name].owner == address(0), "Domain already registered");
        domains[name] = Domain(name, msg.sender, ip);
        emit NewDomainRegistered(name, msg.sender, ip);
    }
    
    // Function to update an existing domain
    function updateDomain(string memory name, string memory ip) public {
        require(domains[name].owner == msg.sender, "You are not the owner of this domain");
        domains[name].ip = ip;
        emit DomainUpdated(name, msg.sender, ip);
    }
}
