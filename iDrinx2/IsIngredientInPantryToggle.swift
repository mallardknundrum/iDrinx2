//
//  IsIngredientInPantryToggle.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/25/22.
//

import SwiftUI

struct IsIngredientInPantryToggle: View {
    
    var ingredientString: String
    @State var isInPantry: Bool
    @ObservedObject var pantryController: PantryController
    
    init(ingredientString: String) {
        self.ingredientString = ingredientString
        self.pantryController = PantryController.singleton
        self.isInPantry = PantryController.singleton.ingredientIsInPantry(ingredientString)
    }
    
    var body: some View {
        Toggle(isOn: $isInPantry) {
            
        }
        .frame(maxWidth: 50.0)
        .onChange(of: isInPantry) { _ in
            if isInPantry {
                pantryController.addIngredient(ingredientString: ingredientString)
            } else {
                pantryController.deleteIngredient(ingredientString: ingredientString)
            }
        }
    }
}

struct IsIngredientInPantryBool_Previews: PreviewProvider {
    static var previews: some View {
        IsIngredientInPantryToggle(ingredientString: "Light rum")
    }
}
