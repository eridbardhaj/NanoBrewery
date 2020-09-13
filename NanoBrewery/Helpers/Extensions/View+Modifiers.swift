//
//  View+Modifiers.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/13/20.
//

import SwiftUI

struct AppTextModifier: ViewModifier {

    // MARK: - Properties
    // MARK: Immutable

    let font: AppFont
    let color: AppColor

    // MARK: - Protocol Conformance
    // MARK: ViewModifier

    func body(content: Content) -> some View {
        content
            .font(font.font)
            .foregroundColor(color.color)
    }
}

struct AppCardModifier: ViewModifier {

    // MARK: - Properties
    // MARK: Immutable

    let backgroundColor: AppColor
    let cornerRadius: CGFloat
    let insets: EdgeInsets

    // MARK: - Protocol Conformance
    // MARK: ViewModifier

    func body(content: Content) -> some View {
        content
            .background(backgroundColor.color)
            .cornerRadius(cornerRadius)
            .padding(insets)
    }
}

extension View {
    
    // MARK: - Text

    func appTitleText(color: AppColor = .superLightText) -> some View {
        appText(font: .title, color: color)
    }

    func appHeaderText(color: AppColor = .superLightText) -> some View {
        appText(font: .heading, color: color)
    }

    func appSubHeadingText(color: AppColor = .superLightText) -> some View {
        appText(font: .subHeading, color: color)
    }

    func appStandardText(color: AppColor = .superLightText) -> some View {
        appText(font: .standard, color: color)
    }
    
    // MARK: - Helpers

    func appText(font: AppFont, color: AppColor) -> some View {
        modifier(AppTextModifier(font: font, color: color))
    }
    
    func appCard(backgroundColor: AppColor = .card,
                 cornerRadius: CGFloat = 10,
                 insets: EdgeInsets) -> some View {
        modifier(AppCardModifier(
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            insets: insets
        ))
    }
}

extension Image {
    func appIcon(with size: CGFloat = 22, color: AppColor) -> some View {
        resizable()
            .scaledToFit()
            .frame(width: size, height: size, alignment: .center)
            .foregroundColor(color.color)
    }
}
