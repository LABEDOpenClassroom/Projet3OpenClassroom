//
//  Character.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

// Define Character class

class Character {
    let name: String
    var health: Int {
        
        didSet {
            if health > maxHealth {
                health = maxHealth
            } else 
            
            if health < 0 {
                health = 0
            }
             }
               }
    let maxHealth: Int
    let weapon: Weapon
    let isAHeal: Bool
    
    init(name: String, maxHealth: Int, weapon: Weapon, isAHeal: Bool) {
        self.name = name
        self.maxHealth = maxHealth
        self.health = maxHealth // Initialize health with maxHealth
        self.weapon = weapon
        self.isAHeal = isAHeal
    }
    
    func getDamageDealt() -> Int {
        return weapon.damage
    }
    
    func isAlive() -> Bool {
        return health > 0
    }
    
    func attack(target: inout Character) {
        
        guard isAlive() else {
            print("\(name) is dead and cannot attack.")
            return
        }
        
        guard target.isAlive() else {
            print("\(target.name) is already dead.")
            return
        }
        
        target.takeDamage(damage: weapon.damage)
    }
    
    func takeDamage(damage: Int) {
        health -= damage
        if !isAlive() {
            print("\(name) has been defeated!")
        }
    }
    
    func heal(target: inout Character) {
        guard isAHeal else {
            print("\(name) cannot heal.")
            return
        }
        
        guard target.isAlive() else {
            print("\(target.name) is already dead.")
            return
        }
        
        target.receiveHealing(healingPoints: weapon.damage)
    }
    
    func receiveHealing(healingPoints: Int) {
        health += healingPoints
        print("\(name) has been healed for \(healingPoints) points.")
    }
}

