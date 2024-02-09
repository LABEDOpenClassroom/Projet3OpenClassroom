
// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//
import Foundation

// Exemple d'utilisation
// Création de quelques personnages

let character1 = Magus(name: "guerrier")
let character2 = Dwarf(name: "Mage")
let character3 = Colossus(name: "Archer")

// Création de l'équipe
let team = Team()

// Ajout des personnages à l'équipe
team.addCharacter(character1)
team.addCharacter(character2)
team.addCharacter(character3)

// Affichage des personnages de l'équipe
print("Personnages dans l'équipe :")
for character in team.characters {
    print(character.name)
}






//game

class Game {
    var player1: Player
    var player2: Player

    init() {
        player1 = Player()
        player2 = Player()
    
    }

    func startGame() {
        print("Welcome to the Battle Game!")

        // Étape 1: Création des équipes
        createTeams()

        

        func createTeams() {
            print("\nPlayer 1, create your team:")
            createTeam(for: player1)
            print("\nPlayer 2, create your team:")
            createTeam(for: player2)
        }

        func createTeam(for player: Player) {
            while !player.isFull {
                
                print("1. Warrior")
                print("2. Magus")
                print("3. Colossus")
                print("4. Dwarf")
                
            }
            
       

        
