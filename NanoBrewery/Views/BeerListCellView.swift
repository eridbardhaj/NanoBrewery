//
//  BeerListCellView.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import SwiftUI

struct BeerListCellView: View {
    
    // MARK: - Inner Types

    private enum Constants {
        static let imageViewSize = CGSize(width: 50, height: 100)

        static let appIconSize: CGFloat = 20
    }

    // MARK: - Properties
    // MARK: Mutable

    @ObservedObject private var viewModel: BeerListCellViewModel
    
    // MARK: - Initializers

    init(viewModel: BeerListCellViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Configuration
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.imageViewSize.width,
                        height: Constants.imageViewSize.height,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                    )
                    .padding(AppPadding.smallPadding)
                    .background(AppColor.light.color)
                rightContent
            }
            .padding(EdgeInsets(horizontal: AppPadding.padding, vertical: AppPadding.smallPadding))
        }
        .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude, alignment: .top)
        .appCard(insets: EdgeInsets(horizontal: AppPadding.padding, vertical: AppPadding.smallPadding))
    }
    
    private var rightContent: some View {
        return VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8) {
            HStack {
                tintedIconTextRow(
                    imageName: "beer-bottle",
                    text: viewModel.name,
                    font: .subHeading,
                    color: .lightText
                )
                Spacer()
                tintedIconTextRow(
                    imageName: "percentage",
                    text: viewModel.percentage,
                    font: .subHeading,
                    color: .superLightText
                )
            }
            
            HStack {
                tintedIconTextRow(
                    imageName: "first-brewed",
                    text: viewModel.firstBrewed,
                    font: .subHeading,
                    color: .lightText
                )
                Spacer()
            }
            Spacer()
            
            HStack {
                ForEach(viewModel.hashtags, id: \.self) { hashtag in
                    Text("#\(hashtag)")
                        .foregroundColor(AppColor.tint.color)
                        .background(AppColor.tint.color.opacity(0.1))
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }
        }
    }
    
    func tintedIconTextRow(imageName: String, text: String, font: AppFont, color: AppColor) -> some View {
        HStack {
            VStack {
                Image(imageName)
                    .appIcon(with: Constants.appIconSize, color: .tint)
                Spacer()
            }
            VStack {
                Text(text)
                    .lineLimit(2)
                    .appText(font: font, color: color)
                Spacer()
            }
        }
    }
}

struct BeerListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let beer = Beer(
            id: 3,
            name: "Pilsen Lager, Pilsen Lager, Pilsen Lager",
            tagline: "Unleash. Yeast. Series. Best.",
            firstBrewed: "09/2013",
            description: "Our Unleash the Yeast series was an epic experiment into the differences in aroma and flavour provided by switching up your yeast. We brewed up a wort with a light caramel note and some toasty biscuit flavour, and hopped it with Amarillo and Centennial for a citrusy bitterness. Everything else is down to the yeast. Pilsner yeast ferments with no fruity esters or spicy phenols, although it can add a hint of butterscotch.",
            percentage: 6,
            imageUrlString: "https://images.punkapi.com/v2/4.png",
            foodPairing: [
                "Spicy crab cakes",
                "Spicy cucumber and carrot Thai salad",
                "Sweet filled dumplings"
            ]
        )
        BeerListCellView(viewModel: BeerListCellViewModel(beer: beer))
    }
}

