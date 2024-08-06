// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/// @title A Lottery Contract
/// @notice This contract allows players to enter a lottery and the owner to pick a winner
/// @dev This contract uses `keccak256` for randomness which is not secure for real-world use
contract Lottery {
    address public manager;
    address[] public players;

    /// @notice Ensures only the owner can call certain functions
    modifier onlyOwner() {
        require(msg.sender == manager, "Caller is not the owner");
        _;
    }

    /// @notice Initializes the contract setting the deployer as the manager
    constructor() {
        manager = msg.sender;
    }

    /// @notice Allows a player to enter the lottery by sending more than 0.01 ether
    function enter() public payable {
        require(msg.value > .01 ether, "Minimum ether not met");
        players.push(msg.sender);
    }

    /// @notice Generates a pseudo-random number
    /// @dev Uses block variables and player addresses for randomness, not secure for production
    /// @return A pseudo-random uint
    function random() private view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(block.difficulty, block.timestamp, players)
                )
            );
    }

    /// @notice Picks a random winner from the players array
    /// @dev Transfers the contract balance to the winner and resets the players array
    function pickWinner() public onlyOwner {
        require(players.length > 0, "No players in the game");

        uint index = random() % players.length;
        address winner = players[index];

        // Transfer the contract balance to the winner
        (bool success, ) = winner.call{value: address(this).balance}("");
        require(success, "Transfer failed");

        // Reset the players array
        players = new address[](0);
    }

    /// @notice Returns the list of players in the lottery
    /// @return An array of player addresses
    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    /// @notice Returns the balance of the contract
    /// @return The balance of the contract in wei
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    /// @notice Allows the manager to withdraw funds in case of an emergency
    function emergencyWithdraw() public onlyOwner {
        (bool success, ) = manager.call{value: address(this).balance}("");
        require(success, "Emergency withdrawal failed");
    }
}
