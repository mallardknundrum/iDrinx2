//
//  ContentView.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    
    var cocktails = CocktailController().getCocktails()
    
    var body: some View {
        //var ingredientNames = [Text]()
        
//        NavigationView{
            TabView {
                SuggestedCocktails()
                    .tabItem {
                        Label {
                            Text("")
                        } icon: {
                            Image("cocktailIcon")
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                        }

                    }
                FavoritesView()
                    .tabItem {
                        Label {
                            Text("")
                        } icon: {
                            Image("heart")
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                                .frame(width: 32.0, height: 32.0)
                        }
                    }
                CocktailSearch()
                    .tabItem {
                        Label {
                            Text("")
                        } icon: {
                            Image("search")
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                        }                    }
                Pantry()
                    .tabItem {
                        Label {
                            Text("")
                        } icon: {
                            Image("bottle")
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                        }                    }
            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*

small image first and name next in hstack
HStack {
    Image("Ale")
        .resizable()
        .scaledToFit()
        .frame(width: 40.0, height: 40.0)
    Spacer()
    Text(cocktail.name).font(.system(.title3))
}
 
 
 VStack {
     Text(cocktail.name).font(.system(.title3))
     HStack {
         Image("Ale")
             .resizable()
             .scaledToFit()
             .frame(width: 100.0, height: 100.0)
         Spacer()
         VStack(alignment: .trailing) {
             ForEach(cocktail.ingredients, id: \.self) { ingredient in
                 Text(ingredient.name).font(.system(.body))
             }
         }
     }
 }

*/
