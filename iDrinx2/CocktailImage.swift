//
//  CocktailImage.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/22/22.
//

import SwiftUI

struct CocktailImage: View {
    let cocktail: Cocktail
    let frame: (CGFloat, CGFloat)
    @State var data: Data?
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: frame.0, height: frame.1)
                .scaledToFit()
        } else {
            Image(cocktail.ingredients[0].name)
                .resizable()
                .frame(width: frame.0, height: frame.1)
                .scaledToFit()
                .onAppear {
                    fetch()
                }
        }
    }
    
    private func fetch() {
        var urlString = ""
        guard let string = cocktail.thumbnail else { return }
            var array = Array(string)
            array.insert("s", at: 4)
            urlString = String(array)
        
        if let data = ImageCacheController().loadImage(urlString: urlString) {
            self.data = data
        } else if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    self.data = data
                    ImageCacheController().storeImage(urlString: urlString, imageData: data)
                }
            }
            task.resume()
        }
    }
}

struct CocktailImage_Previews: PreviewProvider {
    static var previews: some View {
        CocktailImage(cocktail: CocktailController.singleton.getDefaultCocktail(), frame: (30.0, 30.0))
    }
}
