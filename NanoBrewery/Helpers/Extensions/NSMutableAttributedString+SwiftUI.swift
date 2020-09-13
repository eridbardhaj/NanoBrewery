//
//  NSMutableAttributedString+SwiftUI.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/13/20.
//

import UIKit

extension NSMutableAttributedString {
    func highlight(text: String, font: UIFont? = nil, color: UIColor? = nil, backgroundColor: UIColor? = nil) {
        let highlightedRange = (string as NSString).range(of: text)
        guard highlightedRange.length > 0 else { return }

        if let color = color {
            addAttribute(.foregroundColor, value: color, range: highlightedRange)
        }
        if let backgroundColor = backgroundColor {
            addAttribute(.backgroundColor, value: backgroundColor, range: highlightedRange)
        }
        if let font = font {
            addAttribute(.font, value: font, range: highlightedRange)
        }
    }
}

extension String {
    public func mutableAttributedString(font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self as String)
        let range = NSRange(location: 0, length: count)
        attributedText.addAttribute(.font, value: font, range: range)
        attributedText.addAttribute(.foregroundColor, value: color, range: range)
        return attributedText
    }
}

