//
//  ContentView.swift
//  ShimmerEffect
//
//  Created by bhanuteja on 18/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(0..<7) { _ in
                LoadingCellView()
                    .listRowSeparator(.hidden)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
