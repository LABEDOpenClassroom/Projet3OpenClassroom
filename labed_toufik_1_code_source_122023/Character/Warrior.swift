//
//  Warrior.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

class Warrior: Character {
    init(name: String) {
    let weapon = Staff()
        super.init(name: name, maxHealth: 50, weapon: weapon , isAHeal:false)
    }
}

