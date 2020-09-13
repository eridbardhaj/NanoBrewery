//
//  EdgeInsets+Generic.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/14/20.
//

import SwiftUI

extension EdgeInsets {
    init(length: CGFloat) {
        self.init(top: length, leading: length, bottom: length, trailing: length)
    }

    init(horizontal: CGFloat) {
        self.init(horizontal: horizontal, vertical: 0)
    }

    init(vertical: CGFloat) {
        self.init(horizontal: 0, vertical: vertical)
    }

    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}

