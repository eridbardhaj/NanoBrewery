//
//  AttributedText.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/13/20.
//

import SwiftUI

struct AttributedText: UIViewRepresentable {

    // MARK: - Properties
    // MARK: Mutable

    typealias CustomView = UILabel
    var configuration = { (view: CustomView) in }

    // MARK: - Protocol Conformance
    // MARK: UIViewControllerRepresentable

    func makeUIView(context: UIViewRepresentableContext<Self>) -> CustomView {
        let view = CustomView()
        view.numberOfLines = 0
        view.autoresizesSubviews = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }
    
    func updateUIView(_ uiView: CustomView, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}

