
// labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 21/01/2024.
import Foundation
// Define a class named Main
class Main {
    func start() {
        while true{
            
            print("***********************")
            print("1. Start the game 🚀")
            print("2. Quit the game* 🔌")
            print("Choose an option (1-2):")
            print("***********************")
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    let game = Game()
                    print("*******************")
                    print("Starting the game...")
                    print("*******************")
                    game.startGame() 
                case 2:
                    // Quit the application if the user chooses option 2
                    print("Quitting the game.")
                    return
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
