//
//  Magus.swift
//  labed_toufik_1_code_source_122023
//
//  Created by Toufik LABED on 10/01/2024.
//

import Foundation

class Magus: Character {
    init(name: String) {
    let weapon = Sword()
    super.init(name: name, weapon: weapon , isAHeal:true)
    }
}


