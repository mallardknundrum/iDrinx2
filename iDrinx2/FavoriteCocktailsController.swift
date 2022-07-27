//
//  FavoriteCocktailsController.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/21/22.
//

import SwiftUI

class FavoriteCocktailsController: ObservableObject {
    
    static var singleton = FavoriteCocktailsController()
    private var favoriteCocktailsKey = "favoriteCocktailIDs"
    @Published var currentFavoriteCocktails: [Cocktail] = []
    
    init() {
        currentFavoriteCocktails = retrieveFavoritesFromUserDefaults()
    }
    
    
    private func saveFavoritesToUserDefaults() {
        let ids = currentFavoriteCocktails.map {$0.id}
        UserDefaults.standard.set(ids, forKey: favoriteCocktailsKey)
    }
    
    private func deleteFavoriteFromUserDefaults(cocktail: Cocktail) {
        
    }
    
    private func retrieveFavoritesFromUserDefaults() -> [Cocktail] {
        if let ids = UserDefaults.standard.object(forKey: favoriteCocktailsKey) as? [String] {
            var cocktails = [Cocktail]()
            for id in ids {
                let cocktail = CocktailController.singleton.allCocktails.filter { $0.id == id}
                cocktails.append(cocktail[0])
            }
            return cocktails.sorted(by: <)
        } else {
            return []
        }
    }
    
    func addCocktailToFavorites(cocktail: Cocktail) {
        currentFavoriteCocktails.append(cocktail)
        saveFavoritesToUserDefaults()
    }
    
    func deleteCocktailFromFavorites(cocktail: Cocktail) {
        currentFavoriteCocktails = currentFavoriteCocktails.filter { $0.id != cocktail.id }
        saveFavoritesToUserDefaults()
    }
}
