//
//  IngredientSearch.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/22/22.
//

import SwiftUI

struct IngredientSearch: View {

    @State private var searchText = ""
    @Binding var showSheetView: Bool
    @ObservedObject private var pantryController = PantryController.singleton
    
    var body: some View {
        NavigationView {
            List {
                ForEach (searchResults, id: \.self) { ingredient in
                    SearchIngredientsRow(ingredientString: ingredient)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                
            }
            .navigationBarTitle(Text("Ingredients Search"), displayMode: .inline)
                            .navigationBarItems(trailing: Button(action: {
                                print("Dismissing sheet view...")
                                self.showSheetView = false
                            }) {
                                Text("Done").bold()
                            })
                            
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return pantryController.allIngredients.map { $0.name }
        } else {
            return pantryController
                .allIngredients
                .map { $0.name }
                .filter { $0.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct IngredientSearch_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSearch(showSheetView: Pantry().$showSheetView)
    }
}
