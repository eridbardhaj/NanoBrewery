//
//  BeerListView.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import SwiftUI

struct BeerListView: View {

    // MARK: - Properties
    // MARK: Mutable

    @ObservedObject private var viewModel: BeerListViewModel
    
    // MARK: - Initializers

    init(viewModel: BeerListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Configuration

    @ViewBuilder
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading { emptyContent() } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.beerList, id: \.id) { beer in
                                let beerDetails = BeerDetailsView(viewModel: BeerDetailsViewModel(beer: beer))
                                NavigationLink(destination: beerDetails) {
                                    BeerListCellView(viewModel: BeerListCellViewModel(beer: beer))
                                }
                            }
                        }
                        .background(AppColor.background.color)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
            .background(AppColor.background.color)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(viewModel.titleText, displayMode: .inline)
        }
    }

    private func emptyContent() -> some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            ProgressView(viewModel.loadingText)
                .foregroundColor(AppColor.superLightText.color)
                .accentColor(AppColor.superLightText.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView(viewModel: BeerListViewModel())
    }
}
