//
//  CocktailSearch.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct CocktailSearch: View {
    
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach (searchResults) { cocktail in
                    NavigationLink(destination: DetailView(cocktail: cocktail)) {
                        SearchCocktailRow(cocktail: cocktail)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                
            }
        }
    }
    
    var searchResults: [Cocktail] {
        if searchText.isEmpty {
            return CocktailController.singleton.allCocktails
        } else {
            return CocktailController.singleton.allCocktails.filter { cocktail in
                let ingredients = cocktail.ingredients.compactMap {$0.name.lowercased().contains(searchText.lowercased())}
                return cocktail.name.lowercased().contains(searchText.lowercased()) || ingredients.contains(true)
                
            }
        }
    }
}

struct CocktailSearch_Previews: PreviewProvider {
    static var previews: some View {
        CocktailSearch()
    }
}
