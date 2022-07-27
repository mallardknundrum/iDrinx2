//
//  PantryController.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/21/22.
//

import Foundation

class PantryController: ObservableObject {
    
    static var singleton = PantryController()
    
    private var ingredientsKey = "myIngredients"
    @Published var myIngredients: [String] = []
    var allIngredients: [String] = []
    
    init() {
        myIngredients = getMyIngredientsFromUserDefaults()
        allIngredients = getIngredientsFromJSON()
    }
    
    func ingredientIsInPantry(_ ingredientString: String) -> Bool {
        return myIngredients.contains(ingredientString)
    }
    func getIngredientsFromJSON() -> [String] {
        if let path = Bundle.main.path(forResource: "ingredients", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let ingredients = try decoder.decode([String].self, from: data)
                return ingredients.sorted(by: <)
              } catch {
                   return []
              }
        } else {
            return []
        }
    }
    
    func getMyIngredientsFromUserDefaults() -> [String] {
        if let ingredientNames = UserDefaults.standard.object(forKey: ingredientsKey) as? [String] {
            return ingredientNames.sorted(by: <)
        } else {
            return []
        }
    }
    
    func saveMyIngredientsToUserDefaults() {
        UserDefaults.standard.set(myIngredients, forKey: ingredientsKey)
    }
    
    func addIngredient(ingredientString: String) {
        myIngredients.append(ingredientString)
        saveMyIngredientsToUserDefaults()
    }

    func deleteIngredient(ingredientString: String) {
        myIngredients = myIngredients.filter { $0 != ingredientString }
        saveMyIngredientsToUserDefaults()
    }
    
}
