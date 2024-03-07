//
//  Team.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

import Foundation

class Team {
    var usedCharacterNames: Set<String> = []    
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
}

