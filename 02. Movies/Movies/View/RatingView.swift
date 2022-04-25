//
//  RatingView.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        }
        return "star"
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    
    @State private static var rating: Int? = 3
    
    static var previews: some View {
        RatingView(rating: $rating)
    }
}