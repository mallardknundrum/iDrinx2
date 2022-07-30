//
//  TitleText.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/30/22.
//

import SwiftUI

struct TitleText: View {
    @ObservedObject var viewModel: TitleTextViewModel
    var body: some View {
        Text(viewModel.title)
            .font(.system(.title3))
        
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(viewModel: TitleTextViewModel(title: "Some Title", isOffensive: true))
    }
}
