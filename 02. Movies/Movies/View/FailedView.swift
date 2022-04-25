//
//  FailedView.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Text("OOPS!!")
                    .font(.system(size: 45, weight: .heavy, design: .rounded))
                    .foregroundColor(.red)
                    .shadow(color: .yellow, radius: 8, x: 2, y: 2)
                    .shadow(color: .black, radius: 8, x: 6, y: 6)
                .padding()
                Text("OOPS!!")
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .offset(x: -4)
            }
            Spacer()
        }
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
            .previewLayout(.sizeThatFits)
    }
}
