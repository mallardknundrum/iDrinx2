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
                                    Ingredient(name: "Light rum", id: "7ae285d0-b1b6-4604-bd6c-8a8a7fae1ef5", category: "cocktail", amount: "1 oz"),
                                    Ingredient(name: "Añejo rum", id: "b013ba2e-8712-4a8e-b02d-15e9d5371cbc", category: "cocktail", amount: "1 oz"),
                                    Ingredient(name: "Orange juice", id: "a886c1b4-e7f7-49a9-9727-91be1af5df25", category: "general", amount: "1 oz"),
                                    Ingredient(name: "Lemon juice", id: "99755cac-9d5e-40d5-9bba-d562f8799e33", category: "general", amount: "1/2 ozz"),
                                    Ingredient(name: "Ginger ale", id: "f90f288f-7e01-423d-8467-fd9b66de095f", category: "general", amount: "3 oz"),
                                    Ingredient(name: "Lemon peel", id: "5b666e66-8b0e-4c2b-9b92-04190c0a11c9", category: "general", amount: "1 twist of"),
                                  ],
                                  description: "",
                        reviewsAndRatings: [], isOffensive: false)
    }
}
