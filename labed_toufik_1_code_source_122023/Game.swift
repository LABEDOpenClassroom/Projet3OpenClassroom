// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//
import Foundation

// Define a class named Game
class Game {
    // Array to store the characters of player 1 and player 2 teams
    var player1Team: [Character] = []
    var player2Team: [Character] = []
    // Variable to keep track of the current player's turn
    var currentPlayerTurn = 1
    // Used character names
    var usedCharacterNames: Set<String> = []

    // Method to start the game
    func startGame() {
        var turnCounter = 0
        // Create teams for player 1 and player 2
        player1Team = createTeam(playerNumber: 1)
        player2Team = createTeam(playerNumber: 2)
        // Print characters of player 1 and player 2 teams
        print("Characters of Player 1's Team:")
        printTeamCharacters(team: player1Team)
        print("Characters of Player 2's Team:")
        printTeamCharacters(team: player2Team)

        // Begin the combat phase
        while !isGameOver() {
            turnCounter += 1 // Increment the turn counter
            // Print the current player's turn
            print("Player \(currentPlayerTurn)'s Turn")
            let currentPlayerTeam = currentPlayerTurn == 1 ? player1Team : player2Team
            let opponentTeam = currentPlayerTurn == 1 ? player2Team : player1Team
            // Perform the player's turn
            performPlayerTurn(currentPlayerTeam: currentPlayerTeam, opponentTeam: opponentTeam)
            // Switch to the next player's turn
            currentPlayerTurn = currentPlayerTurn == 1 ? 2 : 1
        }
        // Print the winner and game statistics
        printWinnerAndStats()
        print("Number of Turn \(turnCounter)")
    }

    // Method to create a team for a player
    func createTeam(playerNumber: Int) -> [Character] {
        print("Player \(playerNumber), create your team:")
        var team: [Character] = []
        let characterTypes = ["Warrior", "Magus", "Colossus", "Dwarf"]

        while team.count < 3 {
            print("Character type:")
            for (index, type) in characterTypes.enumerated() {
                print("\(index + 1). \(type)")
            }
            print("Choose a character type (1-\(characterTypes.count)):")

            if let choice = readLine(), let typeIndex = Int(choice), typeIndex >= 1 && typeIndex <= characterTypes.count {
                let typeName = characterTypes[typeIndex - 1]
                if let characterName = chooseCharacterName() {
                    let character: Character
                    switch typeName {
                    case "Warrior":
                        character = Warrior(name: characterName)
                    case "Magus":
                        character = Magus(name: characterName)
                    case "Colossus":
                        character = Colossus(name: characterName)
                    case "Dwarf":
                        character = Dwarf(name: characterName)
                    default:
                        fatalError("Unknown character type")
                    }
                    team.append(character)
                    print("\(typeName) \(characterName) added to the team.")
                }
            } else {
                print("Invalid choice. Please choose a number between 1 and \(characterTypes.count).")
            }
        }
        return team
    }

    // Method to choose the name of a character
    func chooseCharacterName() -> String? {
        print("Character name:")
        if let name = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty {
            if usedCharacterNames.contains(name) {
                print("This name is already used. Please choose another name.")
                return chooseCharacterName()
            } else {
                usedCharacterNames.insert(name)
                return name
            }
        } else {
            print("Invalid name. Please enter a valid name.")
            return chooseCharacterName()
        }
    }

    // Method to print the characters of a team
    func printTeamCharacters(team: [Character]) {
        for character in team {
            print("\(character.name) - Health Points: \(character.health)")
        }
    }

    // Method to check if the game is over
    func isGameOver() -> Bool {
        return player1Team.allSatisfy { !$0.isAlive() } || player2Team.allSatisfy { !$0.isAlive() }
    }

    // Method to perform a player's turn
    func performPlayerTurn(currentPlayerTeam: [Character], opponentTeam: [Character]) {
        print("Choose a character from your team:")
        for (index, character) in currentPlayerTeam.enumerated() {
            print("\(index + 1). \(character.name) - Health Points: \(character.health)")
        }

        guard let selectedCharacterIndex = Int(readLine() ?? ""), selectedCharacterIndex > 0 && selectedCharacterIndex <= currentPlayerTeam.count else {
            print("Invalid choice. Please choose a valid number.")
            return
        }

        let selectedCharacter = currentPlayerTeam[selectedCharacterIndex - 1]

        print("*****************")
        print("Choose an action:")
        print("1. Attack")
        print("2. Heal")

        guard let actionChoice = Int(readLine() ?? ""), [1, 2].contains(actionChoice) else {
            print("Invalid choice. Please choose a valid action.")
            return
        }

        switch actionChoice {
        case 1:
            print("Choose a character from the opposing team to attack:")
            for (index, character) in opponentTeam.enumerated() {
                print("\(index + 1) \(character.name) - Health Points: \(character.health)")
            }

            guard let targetCharacterIndex = Int(readLine() ?? ""), targetCharacterIndex > 0 && targetCharacterIndex <= opponentTeam.count else {
                print("Invalid choice. Please choose a valid number.")
                return
            }

            var targetCharacter = opponentTeam[targetCharacterIndex - 1]
            selectedCharacter.attack(target: &targetCharacter)
        case 2:
            print("Choose a character from your team to heal:")
            for (index, character) in currentPlayerTeam.enumerated() {
                print("\(index + 1) \(character.name) - Health Points: \(character.health)")
            }
           

            guard let targetCharacterIndex = Int(readLine() ?? ""), targetCharacterIndex > 0 && targetCharacterIndex <= currentPlayerTeam.count else {
                print("Invalid choice. Please choose a valid number.")
                return
            }

            var targetCharacter = currentPlayerTeam[targetCharacterIndex - 1]
            selectedCharacter.heal(target: &targetCharacter)
            
        default:
            break
        }
    }

    // Method to print the winner and game statistics
    func printWinnerAndStats() {

        // Determine the winner based on the condition of the characters
        let winner = player1Team.allSatisfy { !$0.isAlive() } ? "Player 2" : "Player 1"
        // Print the winner
        print("The winner is: \(winner)")
        // Print game statistics
        print("Game Statistics:")
        // Print the characters of Player 1's team
        print("Player 1's Team:")
        printTeamCharacters(team: player1Team)
        // Print the characters of Player 2's team
        print("Player 2's Team:")
        printTeamCharacters(team: player2Team)
    }
}


