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
    @Published var myIngredients: [Ingredient] = []
    var allIngredients: [Ingredient] = []
    
    init() {
        myIngredients = getMyIngredientsFromUserDefaults()
        allIngredients = getIngredientsFromJSON()
    }
    
    func ingredientIsInPantry(_ ingredientString: String) -> Bool {
        return myIngredients.map( { $0.name } ).contains(ingredientString)
    }
    
    func getIngredientsFromJSON() -> [Ingredient] {
        if let path = Bundle.main.path(forResource: "new_ingredient_list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let ingredients = try decoder.decode([Ingredient].self, from: data)
                return ingredients.sorted { $0.name < $1.name }
              } catch {
                   return []
              }
        } else {
            return []
        }
    }
    
    func getMyIngredientsFromUserDefaults() -> [Ingredient] {
        if let data = UserDefaults.standard.data(forKey: ingredientsKey) {
            do {
                let ingredients = try JSONDecoder().decode([Ingredient].self, from: data)
                return ingredients.sorted { $0.name < $1.name}
            } catch let error {
                print(error.localizedDescription)
                print("problem getting myIngredients from UserDefaults")
                return []
            }
        } else {
            return []
        }
    }
    
    func saveMyIngredientsToUserDefaults() {
        do {
            let encodedIngredients = try JSONEncoder().encode(myIngredients)
            UserDefaults.standard.set(encodedIngredients, forKey: ingredientsKey)
        } catch let error {
            print(error.localizedDescription)
            print("There was an error encoding ingredients and saving to UserDefaults")
        }
        
    }
    
    func addIngredient(ingredientString: String) {
        let ingredient = allIngredients.filter { $0.name == ingredientString }[0]
        myIngredients.append(ingredient)
        saveMyIngredientsToUserDefaults()
    }

    func deleteIngredient(ingredientString: String) {
        myIngredients = myIngredients.filter { $0.name != ingredientString }
        saveMyIngredientsToUserDefaults()
    }
    
}
