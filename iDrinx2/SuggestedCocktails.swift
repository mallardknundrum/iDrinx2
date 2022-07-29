//
//  SuggestedCocktails.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct SuggestedCocktails: View {
    var cocktails = CocktailController().getCocktails()
    @ObservedObject var pantryController = PantryController.singleton
    var filteredCocktails: [Cocktail] {
        return cocktails.filter { cocktail in
            let ingredientsSet = Set(pantryController.myIngredients.map { $0.name } )
            let cocktailIngredientsSet = Set(cocktail.ingredients.map { $0.name })
            return cocktailIngredientsSet.isSubset(of: ingredientsSet)
        }
        .sorted(by: <)
    }
    
    var body: some View {
        //var ingredientNames = [Text]()
        
        NavigationView {
            List {
                ForEach(filteredCocktails) { cocktail in
                    NavigationLink(destination: DetailView(cocktail: cocktail)) {
                        DetailedCocktailRow(cocktail: cocktail)
                    }
                    .listRowSeparator(.visible)
                    .listRowSeparatorTint(.black)
                }
            }
            .navigationTitle("Suggested Cocktails")
        }
    }
}

struct SuggestedCocktails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SuggestedCocktails()
        }
    }
}
