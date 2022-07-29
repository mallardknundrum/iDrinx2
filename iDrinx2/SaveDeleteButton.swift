//
//  SaveDeleteButton.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/21/22.
//

import SwiftUI

struct SaveDeleteButton: View {
    var cocktail: Cocktail
    @ObservedObject var favoriteCocktailController = FavoriteCocktailsController.singleton
    var isInFavorites: Bool {
        return favoriteCocktailController.currentFavoriteCocktails.map { $0.id == cocktail.id }.contains(true)
    }
    var buttonText: String {
        if isInFavorites {
            return "Delete from Favorites"
        } else {
            return "Save to Favorites"
        }
    }
    var buttonTextColor: Color {
        if isInFavorites {
            return .red
        } else {
            return .blue
        }
    }
    func buttonAction() -> Void {
        if isInFavorites {
            return FavoriteCocktailsController.singleton.deleteCocktailFromFavorites(cocktail: cocktail)
        } else {
            return FavoriteCocktailsController.singleton.addCocktailToFavorites(cocktail: cocktail)
        }
    }
    var body: some View {
        Button(action: buttonAction) {
            Text(buttonText)
                .foregroundColor(buttonTextColor)
        }
    }
}

struct SaveDeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveDeleteButton(cocktail: Cocktail(id: "1505bc70-ab27-4818-83bf-ee4b057e7b94",
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
                                            reviewsAndRatings: []))
    }
}
