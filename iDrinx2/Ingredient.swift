//
//  Ingredient.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/29/22.
//

import Foundation

struct Ingredient: Codable, Hashable {
    let name: String
    let id: String
    let category: String
    let amount: String?
}
