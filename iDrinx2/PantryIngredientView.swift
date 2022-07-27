//
//  PantryIngredientView.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/22/22.
//

import SwiftUI

struct PantryIngredientView: View {
    var ingredientString: String
    var body: some View {
        ZStack {
            Image(ingredientString)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2 - 45, height: UIScreen.main.bounds.width / 2 - 45)
                .scaledToFill()
            VStack {
                Spacer()
                HStack {
                    Text(ingredientString)
                        .padding(.trailing)
                    
                        Button(action: {
                            PantryController.singleton.deleteIngredient(ingredientString: ingredientString)
                        }) {
                            Image("garbage")
                                .resizable()
                                .frame(width: 20.0, height: 28.0)
                                .foregroundColor(.red)
                        }
                    
                }
                .background(Color.white.opacity(0.6))
                
                .cornerRadius(5.0)
//                .frame(minWidth: UIScreen.main.bounds.width / 2-60, minHeight: 28, idealHeight: 28, maxHeight: 90.0)
                
                
            }
        }
        .padding(.all)
        .shadow(color: .gray, radius: 10.0)
    }
}

struct PantryIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        PantryIngredientView(ingredientString: "Light rum")
    }
}
