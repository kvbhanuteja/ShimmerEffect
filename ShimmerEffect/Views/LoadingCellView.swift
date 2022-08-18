//
//  LoadingCellView.swift
//  ShimmerEffect
//
//  Created by bhanuteja on 18/08/22.
//

import SwiftUI

struct LoadingCellView: View {
    var body: some View {
        VStack {
            HStack {
                AnimationView(size: CGSize(width: 60, height: 60), cornerRadius: 5)
                VStack(alignment: .leading) {
                    AnimationView(size: CGSize(width: 250, height: 20), cornerRadius: 5)
                    AnimationView(size: CGSize(width: 200, height: 20), cornerRadius: 5)
                    AnimationView(size: CGSize(width: 150, height: 20), cornerRadius: 5)
                }
            }
            
        }.padding()
    }
}

struct LoadingCellView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCellView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
