
// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
//

// Import the file containing the Game class
import Foundation

// Define a class named Main
class Main {
    // Create an instance of the Game class
    let game = Game()
    
    // Method to start the application
    func start() {
        var isRunning = true
        while isRunning {
            // Display menu options
            print("***********************")
            print("1. Start the game 🚀")
            print("2. Quit the game* 🔌")
            print("Choose an option (1-2):")
            print("***********************")
            
            // Read user input and handle menu options
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    // Start the game if the user chooses option 1
                    print("*******************")                    
                    print("Starting the game...")
                    print("*******************")
                    game.startGame() // Call the startGame() method of the Game class
                case 2:
                    // Quit the application if the user chooses option 2
                    print("Quitting the game.")
                    isRunning = false
                default:
                    // Prompt for a valid option if the user enters an invalid choice
                    print("Invalid choice. Please choose a valid option.")
                }
            } else {
                // Prompt for a valid input if the user enters anything other than a number
                print("Invalid input. Please enter a number.")
            }
        }
    }
}

// Create an instance of the Main class and start the application
let main = Main()
main.start()
