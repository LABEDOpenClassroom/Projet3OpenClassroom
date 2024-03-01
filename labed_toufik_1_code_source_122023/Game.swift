
// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

import Foundation


// Define a class named Game

class Game {
    
    // Array to store the characters of player 1 and player 2 teams
    //player1Team et player2Team: Ce sont des tableaux qui stockent les personnages des équipes du joueur 1 et du joueur 2 respectivement.
    var player1Team: [Character] = []
    var player2Team: [Character] = []
    
    // Variable to keep track of the current player's turn
    //currentPlayerTurn: Cette variable garde une trace du tour actuel du joueur.
    
    var currentPlayerTurn = 1
    // Set to store the names of characters already used
    //usedCharacterNames: C'est un ensemble qui stocke les noms de personnages déjà utilisés pour éviter les doublons.
    var usedCharacterNames: Set<String> = []

    
    // Method to start the game
    /*Méthode startGame():
     Cette méthode démarre le jeu en permettant aux joueurs de créer leurs équipes et en lançant la phase de combat.
     Elle appelle createTeam(playerNumber:) pour créer les équipes des deux joueurs.
     Elle affiche les personnages des deux équipes.
     Elle boucle jusqu'à ce que la condition de fin de jeu soit vérifiée, et à chaque tour, elle effectue les actions des joueurs en appelant performPlayerTurn(currentPlayerTeam:opponentTeam:).
     Une fois que la partie est terminée, elle affiche le gagnant et les statistiques du jeu en appelant printWinnerAndStats().*/
    
    
    func startGame() {
        
        
        
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
            // Print the current player's turn
            print("Player \(currentPlayerTurn)'s Turn")
            let currentPlayerTeam = currentPlayerTurn == 1 ? player1Team : player2Team
            let opponentTeam = currentPlayerTurn == 1 ? player2Team : player1Team
            
            // Perform the player's turn
            performPlayerTurn(currentPlayerTeam: currentPlayerTeam, opponentTeam: opponentTeam)
            
            // Switch to the next player's turn  ( L'opérateur ternaire ?:
            currentPlayerTurn = currentPlayerTurn == 1 ? 2 : 1
        }
        
        // Print the winner and game statistics
        printWinnerAndStats()
    }

    // Method to print the characters of a team
    private func printTeamCharacters(team: [Character]) {
        for character in team {
            print("\(character.name) - Health Points: \(character.health)")
        }
    }

    // Method to check if the game is over
    private func isGameOver() -> Bool {
        return player1Team.allSatisfy { !$0.isAlive() } || player2Team.allSatisfy { !$0.isAlive() }
    }

    // Method to perform a player's turn
    private func performPlayerTurn(currentPlayerTeam: [Character], opponentTeam: [Character]) {
        print("Choose a character from your team:")
        printTeamCharacters(team: currentPlayerTeam)
        
        // Prompt the player to choose a character from their team
        
        guard let selectedCharacterIndex = Int(readLine() ?? ""), selectedCharacterIndex > 0 && selectedCharacterIndex <= currentPlayerTeam.count
        else {
            print("Invalid choice. Please choose a valid number.")
            return
        }
        let selectedCharacter = currentPlayerTeam[selectedCharacterIndex - 1]
        
        // Prompt the player to choose an action
        print("*****************")
        print("Choose an action:")
        print("1. Attack")
        print("2. Heal")
        
        // Read the player's action choice
        guard let actionChoice = Int(readLine() ?? ""), actionChoice == 1 || actionChoice == 2 
        
            else {
            print("Invalid choice. Please choose a valid action.")
            return
                 }
        
        // Perform the chosen action
        if actionChoice == 1 {
            // If the player chooses to attack, prompt to choose a character from the opponent's team to attack
            print("Choose a character from the opposing team to attack:")
            printTeamCharacters(team: opponentTeam)
            guard let targetCharacterIndex = Int(readLine() ?? ""), targetCharacterIndex > 0 && targetCharacterIndex <= opponentTeam.count 
                else {
                print("Invalid choice. Please choose a valid number.")
                return
            }
            var targetCharacter = opponentTeam[targetCharacterIndex - 1]
            
            selectedCharacter.attack(target: &targetCharacter)
            //paramètre de type inout (&) pour permettre à la méthode attack de modifier les propriétés du personnage cible si nécessaire.//
            
            }
            else {
            // If the player chooses to heal, prompt to choose a character from their own team to heal
            print("Choose a character from your team to heal:")
            printTeamCharacters(team: currentPlayerTeam)
            guard let targetCharacterIndex = Int(readLine() ?? ""), targetCharacterIndex > 0 && targetCharacterIndex <= currentPlayerTeam.count else {
                print("Invalid choice. Please choose a valid number.")
                return
            }
            var targetCharacter = currentPlayerTeam[targetCharacterIndex - 1]
            // Call the heal method on the selected character
            selectedCharacter.heal(target: &targetCharacter)
        }
    }
    
    // Method to print the winner and game statistics
    private func printWinnerAndStats() {
        // Determine the winner based on the condition of the characters
        let winner = player1Team.allSatisfy { !$0.isAlive() } ? "Player 2" : "Player 1"
        // Print the winner                
        print("The winner is: \(winner)")
        // Print game statistics
        print("Game Statistics:")
        // Print the number of turns played
        print("Number of Turns: \(currentPlayerTurn)")
        // Print the characters of Player 1's team
        print("Player 1's Team:")
        printTeamCharacters(team: player1Team)
        // Print the characters of Player 2's team
        print("Player 2's Team:")
        printTeamCharacters(team: player2Team)
    }
}

