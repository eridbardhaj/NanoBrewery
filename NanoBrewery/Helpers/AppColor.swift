//
//  AppColor.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/13/20.
//

import SwiftUI

enum AppColor {
    case tint
    case card
    case background
    case light
    case superLightText
    case lightText

    var color: Color {
        Color(self.uiColor)
    }

    var uiColor: UIColor {
        switch self {
        case .tint:           return #colorLiteral(red: 0.2588235294, green: 0.7568627451, blue: 0.6745098039, alpha: 1)
        case .card:           return #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.1803921569, alpha: 1)
        case .background:     return #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.137254902, alpha: 1)
        case .superLightText: return #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        case .lightText:      return #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        case .light:          return #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        }
    }
}
