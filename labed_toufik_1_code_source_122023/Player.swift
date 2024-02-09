//
//  Player.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 28/01/2024.
//

import Foundation
// class "Player"
class Player {
    //private //
    var team = Team()
    var isFull : Bool{
        return team.isFull
    
    }
    var isAllCharacterDead : Bool{
        return team.isAllCharacterDead
    }
    func AddCharacter(character:Character) -> Bool{
        return team.addCharacter(character)
    }
    
    //displayTeamStatus
    func displayTeamStatus() {
        team.displayCharacters()
    }
}

