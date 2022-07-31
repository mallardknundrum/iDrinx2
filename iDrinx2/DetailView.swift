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
                            Text(ingredient.amount)
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
        DetailView(cocktail: Cocktail(id: "1505bc70-ab27-4818-83bf-ee4b057e7b94",
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
                                        Cocktail_Ingredient(name: "Lemon juice", amount: "1/2 oz"),
                                        Cocktail_Ingredient(name: "Ginger ale", amount: "3 oz"),
                                        Cocktail_Ingredient(name: "Lemon peel", amount: "1 twist of"),
                                      ],
                                      description: "",
                                      reviewsAndRatings: [], isOffensive: false))
    }
}
