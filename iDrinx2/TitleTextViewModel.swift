//
//  TitleTextViewModel.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/30/22.
//

import SwiftUI

class TitleTextViewModel: ObservableObject {
    
    @Published var title: String
    private var stringTitle: String
    let isOffensive: Bool
    
    init(title: String, isOffensive: Bool) {
        self.isOffensive = isOffensive
        self.stringTitle = title
        if isOffensive {
            self.title = String(repeating: "❄️", count: title.count)
        } else {
            self.title = title
        }
    }
}
