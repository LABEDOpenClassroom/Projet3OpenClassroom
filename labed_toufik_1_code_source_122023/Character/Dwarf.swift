//
//  Dwarf.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

class Dwarf: Character {
    init(name: String) {
    let weapon = Hammer()
        super.init(name: name, maxHealth: 20, weapon: weapon , isAHeal:false)
    }
}
