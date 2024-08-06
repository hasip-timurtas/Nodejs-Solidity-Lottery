// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/// @title Inbox Smart Contract
/// @notice This contract allows users to set and get a message on the Ethereum blockchain
/// @dev The contract includes events, access control, and error handling for improved functionality

contract Inbox {
    string private message;
    address public owner;

    /// @notice Emitted when the message is updated
    /// @param oldMessage The previous message before the update
    /// @param newMessage The new message after the update
    event MessageUpdated(string indexed oldMessage, string indexed newMessage);

    /// @notice Ensures only the owner can call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    /// @notice Initializes the contract with an initial message
    /// @param initialMessage The initial message to set
    constructor(string memory initialMessage) {
        message = initialMessage;
        owner = msg.sender;
    }

    /// @notice Sets a new message
    /// @dev Only the owner can set a new message
    /// @param newMessage The new message to set
    function setMessage(string memory newMessage) public onlyOwner {
        string memory oldMessage = message;
        message = newMessage;
        emit MessageUpdated(oldMessage, newMessage);
    }

    /// @notice Retrieves the current message
    /// @return The current message
    function getMessage() public view returns (string memory) {
        return message;
    }

    /// @notice Transfers ownership of the contract to a new owner
    /// @dev Only the current owner can transfer ownership
    /// @param newOwner The address of the new owner
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }
}
