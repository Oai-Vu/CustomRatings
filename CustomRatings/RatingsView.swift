//
//  RatingsView.swift
//  CustomRatings
//
//  Created by Vũ Quốc Oai on 9/7/24.
//

import SwiftUI

struct RatingsView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String?
    let symbolEnum: Symbol?
    let color: Color
    
    var symbolString: String
    
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbol: String? = "star",
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self.width = width
        self._currentRating = currentRating
        self.symbol = symbol
        self.symbolEnum = nil
        self.color = color
        
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }

    var body: some View {
        HStack {
            Image(systemName: "x.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            ForEach(0..<maxRating, id: \.self) { rating in
                Image(systemName: symbolString)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        currentRating = rating + 1
                    }
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
}

extension RatingsView {
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbolEnum: Symbol?,
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self.width = width
        self._currentRating = currentRating
        self.symbol = nil
        self.symbolEnum = symbolEnum
        self.color = color
        
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }
}

enum Symbol: String {
    case bell
    case bookmark
    case diamond
    case eye
    case flag
    case heart
    case pencil
    case person
    case pin
    case star
    case thumpsUp = "hand.thumpsup"
    case tag
    case trash
}

#Preview {
    struct PreviewWrapper: View {
        let maxRating = 5
        @State var currentRating = 2
        var body: some View {
            RatingsView(
                maxRating: maxRating,
                currentRating: $currentRating
            )
        }
    }
    return PreviewWrapper()
}
