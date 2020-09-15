//
//  BeerDetailsView.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/14/20.
//

import SwiftUI

struct BeerDetailsView: View {
    
    // MARK: - Inner Types
    
    private enum Constants {
        static let imageViewHeight: CGFloat = 300
        static let imageViewWidthRatio: CGFloat = 0.3
        
        static let appIconSize: CGFloat = 25
    }
    
    // MARK: - Properties
    // MARK: Mutable
    
    @ObservedObject private var viewModel: BeerDetailsViewModel
    
    // MARK: - Initializers
    
    init(viewModel: BeerDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Configuration

    var body: some View {
        AppColor.background.color
            .edgesIgnoringSafeArea(.bottom)
            .overlay(
                content
            )
    }
    
    var content: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    headerContent(for: geometry)
                        .padding(EdgeInsets(horizontal: AppPadding.padding, vertical: AppPadding.smallPadding))

                    sectionsContent()
                        .padding(EdgeInsets(horizontal: AppPadding.padding, vertical: AppPadding.smallPadding))

                    Spacer()
                }
                .background(AppColor.background.color)
                .navigationBarTitle(viewModel.titleText, displayMode: .inline)
            }
        }
    }

    private func headerContent(for geometry: GeometryProxy) -> some View {
        HStack(alignment: .top, spacing: AppPadding.padding) {
            leftHeaderContent()
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(
                    width: geometry.size.width * Constants.imageViewWidthRatio,
                    height: Constants.imageViewHeight,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                )
                .padding(AppPadding.smallPadding)
                .background(AppColor.light.color)
        }
    }

    private func leftHeaderContent() -> some View {
        return VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: AppPadding.smallPadding) {
            HStack {
                Text(viewModel.name)
                    .appText(font: .heading, color: .superLightText)
                    .lineLimit(3)
                Spacer()
            }
            HStack {
                Text(viewModel.firstBrewed)
                    .appText(font: .subHeading, color: .tint)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: AppPadding.padding, trailing: 0))

            VStack(alignment: .leading, spacing: AppPadding.smallPadding) {
                ForEach(viewModel.leftEntries, id: \.text) { leftEntry in
                    tintedIconTextRow(leftEntry: leftEntry)
                }
            }
        }
    }

    private func sectionsContent() -> some View {
        Group {
            Text(viewModel.ingredientsHint)
                .appText(font: .heading, color: .lightText)
            Text(viewModel.ingredients)
                .appText(font: .subHeading, color: .superLightText)

            Text(viewModel.descriptionHint)
                .appText(font: .heading, color: .lightText)
            Text(viewModel.description)
                .appText(font: .subHeading, color: .superLightText)
        }
    }
    
    // MARK: - Helpers
    // MARK: View Creation
    
    private func tintedIconTextRow(leftEntry: BeerDetailsViewModel.LeftEntry) -> some View {
        HStack(alignment: .center, spacing: AppPadding.smallPadding) {
            Image(leftEntry.imageName)
                .appIcon(with: Constants.appIconSize, color: .lightText)
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text(leftEntry.hint)
                        .appText(font: .standard, color: .lightText)
                }
                HStack {
                    Spacer()
                    Text(leftEntry.text)
                        .appText(font: .heading, color: .superLightText)
                }
            }
        }
    }
}

struct BeerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let beer = Beer(
            id: 3,
            name: "Pilsen Lager Pilsen Lager Pilsen Lager Pilsen Lager",
            tagline: "Unleash. Yeast. Series. Best.",
            description: "Our Unleash the Yeast series was an epic experiment into the differences in aroma and flavour provided by switching up your yeast. We brewed up a wort with a light caramel note and some toasty biscuit flavour, and hopped it with Amarillo and Centennial for a citrusy bitterness. Everything else is down to the yeast. Pilsner yeast ferments with no fruity esters or spicy phenols, although it can add a hint of butterscotch.",
            gravity: 1050,
            bitterness: 60,
            firstBrewed: "07/2007",
            percentage: 4.5,
            imageUrlString: "https://images.punkapi.com/v2/4.png",
            ingredients: [
                "malt",
                "hops",
                "yeast"
            ]
        )
        BeerDetailsView(viewModel: BeerDetailsViewModel(beer: beer))
    }
}


