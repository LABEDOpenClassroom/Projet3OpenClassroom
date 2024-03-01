//
//  Team.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

import Foundation

var usedCharacterNames: Set<String> = []

func createTeam(playerNumber: Int) -> [Character] {
    
    // Prompt the player to create their team
    print("Player \(playerNumber), create your team:")
    
    // Array to store the characters of the team being created
    
    var team: [Character] = []
    
    // Loop until the team has 3 characters
    
    while team.count < 3 {
        
        // Prompt the player to choose the type of character
        print("Character type:")
        print("1. Warrior")
        print("2. Magus")
        print("3. Colossus")
        print("4. Dwarf")
        print("Choose a character type (1-4): ")
        
        // Read the player's choice
        if let choice = readLine(), let type = Int(choice) {
            switch type {
            case 1:
                // If the player chooses Warrior, prompt for the character name and create a Warrior
                if let characterName = chooseCharacterName() {
                    
                    let warrior = Warrior(name: characterName)
                    team.append(warrior)
                    print("Warrior \(characterName) added to the team.")
                }
            case 2:
                // If the player chooses Magus, prompt for the character name and create a Magus
                if let characterName = chooseCharacterName() {
                    
                    let magus = Magus(name: characterName)
                    team.append(magus)
                    
                    print("Magus \(characterName) added to the team.")
                    
                }
            case 3:
                // If the player chooses Colossus, prompt for the character name and create a Colossus
                if let characterName = chooseCharacterName() {
                    let colossus = Colossus(name: characterName)
                    team.append(colossus)
                    print("Colossus \(characterName) added to the team.")
                   
                }
            case 4:
                // If the player chooses Dwarf, prompt for the character name and create a Dwarf
                if let characterName = chooseCharacterName() {
                    let dwarf = Dwarf(name: characterName)
                    team.append(dwarf)
                    print("Dwarf \(characterName) added to the team.")
                    
                }
            default:
                // If the player chooses an invalid option, prompt for a valid choice
                print("Invalid choice. Please choose a number between 1 and 4.")
            }
        }
    }
    // Return the created team
    return team
}

// Method to choose the name of a character

//Méthode chooseCharacterName():
 

func chooseCharacterName() -> String? {
    // Prompt the player to enter the character name
    print("Character name:")
    
    
         if let name = readLine(), !name.isEmpty && name.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
        
             if usedCharacterNames.contains(name) {
            // If the name is already used, prompt for another name
            print("This name is already used. Please choose another name.")
            return chooseCharacterName()
        }
       
             else {
               // If the name is not used, add it to the used names set and return it
               usedCharacterNames.insert(name)
            
               return name
            
               }
    }
    else  {
            // If the entered name is empty, prompt for a valid name
            print("Invalid name. Please enter a valid name.")
             return chooseCharacterName()
           }
}
