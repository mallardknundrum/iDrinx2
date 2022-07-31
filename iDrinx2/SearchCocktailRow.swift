//
//  SearchCocktailRow.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/20/22.
//

import SwiftUI

struct SearchCocktailRow: View {
    let cocktail: Cocktail
    
    var body: some View {
        HStack {
            CocktailImage(cocktail: cocktail, frame: (30.0, 30.0))
            Spacer()
            TitleText(viewModel: TitleTextViewModel(title: cocktail.name, isOffensive: cocktail.isOffensive))
        }
    }
}

struct SearchCocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchCocktailRow(cocktail: CocktailController.singleton.getDefaultCocktail())
    }
}
