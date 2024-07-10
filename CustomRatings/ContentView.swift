//
//  ContentView.swift
//  CustomRatings
//
//  Created by Vũ Quốc Oai on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var starRating = 0
    @State private var heartRating = 0
    @State private var pinRating = 0
    @State private var bookmarkRating = 0
    @State private var flagRating = 0
    
    var body: some View {
        RatingsView(
            maxRating: 5,
            currentRating: $starRating
        )
        
        RatingsView(
            maxRating: 3,
            currentRating: $heartRating,
            width: 50,
            symbol: "heart",
            color: .red
        )
        
        RatingsView(
            maxRating: 5,
            currentRating: $pinRating,
            width: 40,
            symbol: "pin",
            color: .blue
        )
        
        RatingsView(
            maxRating: 5,
            currentRating: $bookmarkRating,
            symbolEnum: .bookmark,
            color: .teal
        )
        
        RatingsView(
            maxRating: 7,
            currentRating: $flagRating,
            width: 30,
            symbolEnum: .flag,
            color: .green
        )
    }
}

#Preview {
    ContentView()
}
