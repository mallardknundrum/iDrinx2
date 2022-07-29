//
//  Cocktail.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/15/22.
//

import SwiftUI

struct Cocktail: Codable, Identifiable, Hashable, Comparable {
    static func < (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: String
    let name: String
    let category: String
    let glassType: String
    let isAlcoholic: Bool
    let instructions: String
    let dateModified: String?
    let thumbnail: String?
    let ingredients: [Cocktail_Ingredient]
    let description: String
    let reviewsAndRatings: [ReviewAndRating]
}

//{
//    "apiID": "11000",
//    "id": "558d9c99-ac5c-4030-9ef5-d9e9bddbdad1",
//    "name": "A Furlong Too Late",
//    "category": "Ordinary Drink",
//    "glassType": "Highball glass",
//    "isAlcoholic": true,
//    "instructions": "Pour the rum and ginger beer into a highball glass almost filled with ice cubes. Stir well. Garnish with the lemon twist.",
//    "dateModified": "2016-08-31 19:46:06",
//    "thumbnail": "http://www.thecocktaildb.com/images/media/drink/ssxvww1472669166.jpg",
//    "ingredients": [
//      {
//        "name": "Light rum",
//        "amount": "2 oz"
//      },
//      {
//        "name": "Ginger beer",
//        "amount": "4 oz"
//      },
//      {
//        "name": "Lemon peel",
//        "amount": "1 twist of"
//      }
//    ],
//    "reviewsAndRatings": [],
//    "description": ""
//  },
