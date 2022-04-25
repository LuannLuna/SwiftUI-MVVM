//
//  String+Extensions.swift
//  Movies
//
//  Created by Luann Luna on 25/04/22.
//

import Foundation

extension String {
    var trimmedAndEscaped: String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
