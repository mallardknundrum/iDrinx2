//
//  DetailedCocktailRow.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct DetailedCocktailRow: View {
    
    let cocktail: Cocktail
    
    var body: some View {
        VStack {
            Text(cocktail.name).font(.system(.title3))
            HStack {
                CocktailImage(cocktail: cocktail, frame: (100.0, 100.0))
                
                Spacer()
                VStack(alignment: .trailing) {
                    ForEach(cocktail.ingredients, id: \.self) { ingredient in
                        Text(ingredient.name).font(.system(.body))
                    }
                }
            }
        }
        .shadow(color: .gray, radius: 10)
        .cornerRadius(10)
        .padding(.vertical)
    }
    
}

struct DetailedCocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCocktailRow(cocktail: Cocktail(id: "1505bc70-ab27-4818-83bf-ee4b057e7b94",
                                     name: "A Night In Old Mandalay",
                                     category: "Ordinary Drink",
                                     glassType: "Highball glass",
                                     isAlcoholic: true,
                                     instructions: "In a shaker half-filled with ice cubes, combine the light rum, añejo rum, orange juice, and lemon juice. Shake well. Strain into a highball glass almost filled with ice cubes. Top with the ginger ale. Garnish with the lemon twist.",
                                     dateModified: "2016-04-29 09:43:00",
                                     thumbnail: "http://www.thecocktaildb.com/images/media/drink/vyrvxt1461919380.jpg",
                                     ingredients: [
                                     Ingredient(name: "Light rum", amount: "1 oz"),
                                     Ingredient(name: "Añejo rum", amount: "1 oz"),
                                     Ingredient(name: "Orange juice", amount: "1 oz"),
                                     Ingredient(name: "Lemon juice", amount: "1/2 ozz"),
                                     Ingredient(name: "Ginger ale", amount: "3 oz"),
                                     Ingredient(name: "Lemon peel", amount: "1 twist of"),
                                     ],
                                     description: "",
                                     reviewsAndRatings: []))
    }
}

//{
//    "apiID": "11001",
//    "id": "1505bc70-ab27-4818-83bf-ee4b057e7b94",
//    "name": "A Night In Old Mandalay",
//    "category": "Ordinary Drink",
//    "glassType": "Highball glass",
//    "isAlcoholic": true,
//    "instructions": "In a shaker half-filled with ice cubes, combine the light rum, añejo rum, orange juice, and lemon juice. Shake well. Strain into a highball glass almost filled with ice cubes. Top with the ginger ale. Garnish with the lemon twist.",
//    "dateModified": "2016-04-29 09:43:00",
//    "thumbnail": "http://www.thecocktaildb.com/images/media/drink/vyrvxt1461919380.jpg",
//    "ingredients": [
//      {
//        "name": "Light rum",
//        "amount": "1 oz"
//      },
//      {
//        "name": "Añejo rum",
//        "amount": "1 oz"
//      },
//      {
//        "name": "Orange juice",
//        "amount": "1 oz"
//      },
//      {
//        "name": "Lemon juice",
//        "amount": "1/2 oz"
//      },
//      {
//        "name": "Ginger ale",
//        "amount": "3 oz"
//      },
//      {
//        "name": "Lemon peel",
//        "amount": "1 twist of"
//      }
//    ],
//    "reviewsAndRatings": [],
//    "description": ""
//  },
