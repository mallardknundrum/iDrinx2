//
//  FavoritesView.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/21/22.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var cocktailController = FavoriteCocktailsController.singleton
    var body: some View {
        NavigationView {
            List {
                ForEach($cocktailController.currentFavoriteCocktails) { $cocktail in
                    NavigationLink(destination: DetailView(cocktail: cocktail)) {
                        DetailedCocktailRow(cocktail: cocktail)
                    }
                }
            }.navigationTitle("Favorite Cocktails")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
