//
//  Colossus.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

class Colossus: Character {
    init(name: String) {
    let weapon = Axe()
        super.init(name: name, maxHealth: 90, weapon: weapon , isAHeal:false)
    }
}
