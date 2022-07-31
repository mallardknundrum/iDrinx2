//
//  DetailView.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct DetailView: View {
    let cocktail: Cocktail
    @ObservedObject private var pantryController: PantryController = PantryController.singleton

    
    var body: some View {
        ScrollView {
            VStack {
                TitleText(viewModel: TitleTextViewModel(title: cocktail.name, isOffensive: cocktail.isOffensive))
                CocktailImage(cocktail: cocktail, frame: (UIScreen.main.bounds.width * 0.9, UIScreen.main.bounds.height * 0.5))
                    .padding()
                HStack {
                    VStack {
                        Text("Ingredient")
                            .underline()
                        ForEach(cocktail.ingredients, id: \.self) { ingredient in
                            HStack(alignment: .center) {
                                Text(ingredient.name)
                                    .frame(minHeight: 32)
                            }
                        }
                    }
                    VStack {
                        Text("Amount")
                            .underline()
                        ForEach(cocktail.ingredients, id: \.self) { ingredient in
                            Text(ingredient.amount ?? "")
                                .frame(minHeight: 32)
                        }
                    }
                    VStack {
                        Text("In Pantry").underline()
                        ForEach(cocktail.ingredients, id: \.self) { ingredient in
                            IsIngredientInPantryToggle(ingredientString: ingredient.name)
                            Spacer()
                        }
                    }
                }
                
                Text(cocktail.instructions).font(Font.body).padding()
                SaveDeleteButton(cocktail: cocktail)
                .padding(.bottom, 16.0)
            }
        }
        .shadow(color: .gray, radius: 10)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(cocktail: CocktailController.singleton.getDefaultCocktail())
    }
}
