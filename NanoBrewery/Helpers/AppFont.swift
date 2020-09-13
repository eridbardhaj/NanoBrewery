//
//  AppFont.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/13/20.
//

import SwiftUI

enum AppFont {
    case title
    case heading
    case subHeading
    case standard

    var font: Font {
        switch self {
        case .title:        return Font.system(size: 32)
        case .heading:      return Font.system(size: 24)
        case .subHeading:   return Font.system(size: 16)
        case .standard:     return Font.system(size: 12)
        }
    }
    
    var uiFont: UIFont {
        switch self {
        case .title:        return UIFont.systemFont(ofSize: 32)
        case .heading:      return UIFont.systemFont(ofSize: 24)
        case .subHeading:   return UIFont.systemFont(ofSize: 16)
        case .standard:     return UIFont.systemFont(ofSize: 12)
        }
    }
}
