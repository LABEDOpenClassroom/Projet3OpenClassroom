//
//  Team.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

import Foundation

class Team {

    var characters: [Character] = []
    let maxCharacter = 3

    var isFull: Bool {
        return characters.count >= maxCharacter
    }

    var isAllCharacterDead: Bool {
        // test if character isalive Retourne true si tous les personnages du tableau sont morts, false sinon
        return characters.allSatisfy { $0.isAlive == false }
    }

    // New function "isNameAlreadyUsed"
    func isNameAlreadyUsed(_ name: String) -> Bool {
        return characters.contains { $0.name == name }
    }

    // Add new character //Méthode pour ajouter un personnage à l'équipe
    func addCharacter(_ character: Character) -> Bool {
        guard !isFull else {
            return false
        }

        characters.append(character)

        print("\(character.name) a été ajouté à l'équipe.")

        return true
    }

    func displayCharacters() {
        print("Statut de l'équipe :")

        guard !characters.isEmpty else {
            print(" Team Vide")
            return
        }

        for character in characters {
            print("\(character.name) - Points de vie : \(character.health)")
        }
    }
}
