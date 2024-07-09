//
//  ContentView.swift
//  CustomRatings
//
//  Created by Vũ Quốc Oai on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    var body: some View {
        RatingsView(
            maxRating: 5,
            currentRating: $currentRating
        )
    }
}

#Preview {
    ContentView()
}
