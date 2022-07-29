//
//  Pantry.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct Pantry: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var showSheetView = false
    
    @ObservedObject var pantryController = PantryController.singleton
    
    
    let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width / 2 - 32), spacing: 25, alignment: nil),
        GridItem(.fixed(UIScreen.main.bounds.width / 2 - 32), spacing: 25, alignment: nil),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(pantryController.myIngredients.map { $0.name }, id: \.self) { name in
                        PantryIngredientView(ingredientString: name)
                    }
                }
                .navigationTitle("Pantry")
            }.navigationBarItems(trailing:
                                    Button(action: {
                self.showSheetView.toggle()
                                    }) {
                                        Image(systemName: "plus").imageScale(.large)
                                    }
                                )
        }.sheet(isPresented: $showSheetView) {
            IngredientSearch(showSheetView: self.$showSheetView)
        }
    }
}

struct Pantry_Previews: PreviewProvider {
    static var previews: some View {
        Pantry()
    }
}
