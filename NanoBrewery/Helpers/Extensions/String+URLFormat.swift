//
//  URL+Required.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import Foundation

extension String {
    
    /// Unwrapped value of a URL. Please give the correct string, otherwise it will crash
    var requiredURL: URL {
        guard let url = URL(string: self) else {
            fatalError("Cannot create a URL from this string")
        }
        return url
    }
}
