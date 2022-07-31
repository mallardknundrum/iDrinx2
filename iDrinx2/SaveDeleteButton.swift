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
        SaveDeleteButton(cocktail: CocktailController.singleton.getDefaultCocktail())
    }
}
