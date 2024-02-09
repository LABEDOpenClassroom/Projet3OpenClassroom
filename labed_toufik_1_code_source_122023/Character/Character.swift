//
//  Character.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

// Define Character struct
class Character {
    let name: String
    var health: Int = 100
    {
        didSet{
            if health > 100
            {
                health = 100
            }
            if health < 0 {
                health = 0
                
            }
        }
    }
    var isAlive : Bool
    {
        if health > 0 {
            return true
        }
        else {
            return false
        }
    }
    var weapon: Weapon
    var isAHeal:Bool
    init(name:String , weapon : Weapon , isAHeal:Bool ){
        self.name = name
        self.weapon = weapon
        self.isAHeal = isAHeal
        
    }
    
    func doAction ( receiver: Character) {
        if receiver.isAlive {
            receiver.health -= weapon.damage
        }
        else {
            return
        }
    }
}
