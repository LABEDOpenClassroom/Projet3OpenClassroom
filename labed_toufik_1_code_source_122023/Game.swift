//
//  Game.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Damien Rivet on 09/02/2024.
//

import Foundation

class Game {

    enum Action {
        /// The character will perform an attack with its current weapon
        case attack

        /// The character will heal another character from its team, only available to healing characters
        case heal
    }

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
        var gameShouldContinue = true
        while gameShouldContinue {
            // Iterate over all the available players, in our case, two of them
            for currentPlayer in players {
                let otherPlayer = findOtherPlayer(currentPlayer: currentPlayer)

                let selectedCharacter = makePlayerSelectCharacter(player: currentPlayer)
                let selectedAction = makePlayerSelectAction(for: selectedCharacter)

                switch selectedAction {
                case .attack:
                    let targetedCharacter = makePlayerSelectCharacter(player: otherPlayer)

                    // TODO: Remove health points from the targeted character

                case .heal:
                    let targetedCharacter = makePlayerSelectCharacter(player: currentPlayer)

                    // TODO: Add health points to the targeted character
                }

                if otherPlayer.isAllCharacterDead {
                    // End of the game
                    gameShouldContinue = false

                    // TODO: Print game summary
                } else {
                    // One more turn
                    numberOfTurns += 1
                }
            }
        }
    }

    func makePlayerSelectCharacter(player: Player) -> Character {
        while true {
            print("")
            print("Please, select a character from player \(player.number) :")
            print("")

            var index = 1
            for currentCharacter in player.team.characters where currentCharacter.isAlive {
                print("\(index). \(currentCharacter.name) - \(currentCharacter.health)")
            }

            if let userChoice = readLine(), let indexOfChoice = Int(userChoice), indexOfChoice <= player.team.characters.count {
                return player.team.characters[indexOfChoice]
            } else {
                print("Please, make a valid choice.")
            }
        }
    }

    func makePlayerSelectAction(for character: Character) -> Action {
        while true {
            print("")
            print("Please, select an action for \(character.name) to perform:")
            print("")
            print("1. Attack")

            if character.isAHeal {
                print("2. Heal")
            }

            if let userChoice = readLine() {
                switch userChoice {
                case "1":
                    return .attack

                case "2":
                    return .heal

                default:
                    print("Please, make a valid choice.")
                }
            }
        }

    }

    func createTeams() {
        for currentPlayer in players {
            print("")
            print("Player \(currentPlayer), create your team:")

            createTeam(for: currentPlayer)
        }
    }

    func createTeam(for player: Player) {
        while !player.isFull {
            print("Please select a character class:")
            print("1. Warrior")
            print("2. Magus")
            print("3. Colossus")
            print("4. Dwarf")

            guard let userChoice = readLine() else {
                continue
            }

            let selectedCharacterClass: String
            switch userChoice {
            case "1":
                selectedCharacterClass = "warrior"

            case "2":
                selectedCharacterClass = "magus"

            case "3":
                selectedCharacterClass = "colossus"

            case "4":
                selectedCharacterClass = "dwarf"

            default:
                print("Please select a valid character type")
                continue
            }
            
            let newCharacterName = askForCharacterName()

            // TODO: Create character with the specified class and the unique name
        }
    }

    func askForCharacterName() -> String {
        while true {
            print("")
            print("Please enter a name for your character:")

            guard let newCharacterName = readLine(), !newCharacterName.isEmpty else {
                print("Please enter a valid name")
                continue
            }

            // TODO: Check that this name isn't already taken by another character
            var hasDuplicate = false
            for currentPlayer in players {
                for currentCharacter in currentPlayer.team.characters {
                    if currentCharacter.name == newCharacterName {
                        hasDuplicate = true
                    }
                }
            }

            guard !hasDuplicate else {
                print("There is already a character with this name, please enter a different one")
                continue
            }

            return newCharacterName
        }
    }
}
