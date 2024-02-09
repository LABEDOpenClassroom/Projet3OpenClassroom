
// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

import Foundation

while true {
    print("Welcome to battle game!")
    printMainMenu()

    if let userChoice = readLine() {
        switch userChoice {
        case "1":
            let game = Game()

            game.startGame()

        case "2":
            exit(0)

        default:
            print("Please make a valid choice!")
        }
    }
}

func printMainMenu() {
    print("#####")
    print("Please make a choice:")
    print("1. Start a new game")
    print("2. Quit game")
}





// Exemple d'utilisation
// Création de quelques personnages

//let character1 = Magus(name: "guerrier")
//let character2 = Dwarf(name: "Mage")
//let character3 = Colossus(name: "Archer")
//
//// Création de l'équipe
//let team = Team()
//
//// Ajout des personnages à l'équipe
//team.addCharacter(character1)
//team.addCharacter(character2)
//team.addCharacter(character3)
//
//// Affichage des personnages de l'équipe
//print("Personnages dans l'équipe :")
//for character in team.characters {
//    print(character.name)
//}
