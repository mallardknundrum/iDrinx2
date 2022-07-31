//
//  CocktailController.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/15/22.
//

import SwiftUI

class CocktailController {
    
    static let singleton = CocktailController()
    let allCocktails: [Cocktail]
    
    
    func getCocktails() -> [Cocktail] {
        if let path = Bundle.main.path(forResource: "cocktail_list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let cocktails = try decoder.decode([Cocktail].self, from: data)
                return cocktails.sorted(by: <)
              } catch {
                   return []
              }
        } else {
            return []
        }
    }
    
    init() {
        if let path = Bundle.main.path(forResource: "cocktail_list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let cocktails = try decoder.decode([Cocktail].self, from: data)
                allCocktails = cocktails.sorted(by: <)
              } catch {
                   allCocktails = []
              }
        } else {
            allCocktails = []
        }
    }
    
    func getDefaultCocktail() -> Cocktail {
        return Cocktail(id: "1505bc70-ab27-4818-83bf-ee4b057e7b94",
                                  name: "A Night In Old Mandalay",
                                  category: "Ordinary Drink",
                                  glassType: "Highball glass",
                                  isAlcoholic: true,
                                  instructions: "In a shaker half-filled with ice cubes, combine the light rum, añejo rum, orange juice, and lemon juice. Shake well. Strain into a highball glass almost filled with ice cubes. Top with the ginger ale. Garnish with the lemon twist.",
                                  dateModified: "2016-04-29 09:43:00",
                                  thumbnail: "http://www.thecocktaildb.com/images/media/drink/vyrvxt1461919380.jpg",
                                  ingredients: [
                                  Cocktail_Ingredient(name: "Light rum", amount: "1 oz"),
                                  Cocktail_Ingredient(name: "Añejo rum", amount: "1 oz"),
                                  Cocktail_Ingredient(name: "Orange juice", amount: "1 oz"),
                                  Cocktail_Ingredient(name: "Lemon juice", amount: "1/2 ozz"),
                                  Cocktail_Ingredient(name: "Ginger ale", amount: "3 oz"),
                                  Cocktail_Ingredient(name: "Lemon peel", amount: "1 twist of"),
                                  ],
                                  description: "",
                        reviewsAndRatings: [], isOffensive: false)
    }
}
