//
//  MoviewDetailView.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct MoviewDetailView: View {
    
    let viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: viewModel.poster)
                    .cornerRadius(10)
                
                Text(viewModel.title)
                    .font(.title)
                
                Text(viewModel.plot)
                Text("Director")
                    .fontWeight(.bold)
                Text(viewModel.director)
                HStack {
                    RatingView(rating: .constant(viewModel.rating))
                    Text("\(viewModel.rating)/10")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(self.viewModel.title)
        }
    }
}
