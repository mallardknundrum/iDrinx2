//
//  SearchIngredientsRow.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/22/22.
//

import SwiftUI

struct SearchIngredientsRow: View {
    
    var ingredientString: String
    @ObservedObject private var pantryController: PantryController
    @State var ingredientIsInPantry: Bool
    
    init(ingredientString: String) {
        self.ingredientString = ingredientString
        self.pantryController = PantryController.singleton
        ingredientIsInPantry = PantryController.singleton.ingredientIsInPantry(ingredientString)
    }

    var body: some View {
        HStack {
            
            
            Image(ingredientString)
                .resizable()
                .frame(width: 30.0, height: 30.0)
                .padding()
            Spacer()
            Text(ingredientString).font(.system(.title3))
            Spacer()
            Toggle("", isOn: $ingredientIsInPantry)
                .padding()
                .frame(width: 75.0, height: 40.0)
                .onChange(of: ingredientIsInPantry) { _ in
                    if ingredientIsInPantry {
                        pantryController.addIngredient(ingredientString: ingredientString)
                    } else {
                        pantryController.deleteIngredient(ingredientString: ingredientString)
                    }
                }
        }
        .padding(.horizontal, 10.0)
        .shadow(color: .gray, radius: 10.0)
    }
}

struct SearchIngredientsRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchIngredientsRow(ingredientString: "Light rum")
    }
}
