//
//  Game.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Damien Rivet on 09/02/2024.
//

import Foundation

class Game {

    let player1: Player
    let player2: Player

    var players: [Player] {
        [player1, player2]
    }

    var numberOfTurns = 1

    init() {
        player1 = Player(number: 1)
        player2 = Player(number: 2)
    }

    func findOtherPlayer(currentPlayer: Player) -> Player {
        for otherPotentialPlayer in players {
            if otherPotentialPlayer.number != currentPlayer.number {
                return otherPotentialPlayer
            }
        }

        fatalError("Should have found another player!")
    }

    func startGame() {
        print("")
        print("A new game has started!")

        // Étape 1: Création des équipes
        createTeams()

        // Inner game loop
        while true {
            for currentPlayer in players {
                let otherPlayer = findOtherPlayer(currentPlayer: currentPlayer)

                let selectedCharacter = makePlayerSelectCharacter(player: currentPlayer)
                let selectedAction = makePlayerSelectAction(for: selectedCharacter)

                switch selectedAction {
                case "attack":
                    let targetedCharacter = makePlayerSelectCharacter(player: otherPlayer)

                    // TODO: Remove health points from the targeted character

                case "heal":
                    let targetedCharacter = makePlayerSelectCharacter(player: currentPlayer)

                    // TODO: Add health points to the targeted character

                default:
                    print("Should not happen")
                }
            }

            // TODO: Check if one player has lost (all characters are dead)
            // TODO: If one player has lost, stop the game, print the summary of the game
            // TODO: If no player has lost, increment the turn counter, restart inner game loop
        }
    }

    func makePlayerSelectCharacter(player: Player) -> Character {
        // TODO: Print the list of characters from the specified player that are alive
        // TODO: Return the selected character

        return Character(name: "", weapon: Weapon(name: "", damage: 1), isAHeal: false)
    }

    func makePlayerSelectAction(for character: Character) -> String {
        // TODO: Print the list of available actions for the specified character
        // TODO: Return the selected action

        return ""
    }

    func createTeams() {
        print("\nPlayer 1, create your team:")
        createTeam(for: player1)

        print("\nPlayer 2, create your team:")
        createTeam(for: player2)
    }

    func createTeam(for player: Player) {
        while !player.isFull {
            print("Please select a character class:")
            print("1. Warrior")
            print("2. Magus")
            print("3. Colossus")
            print("4. Dwarf")

            if let userChoice = readLine() {
// TODO: Use a switch to create the corresponding character instance
            }
        }
    }
}
