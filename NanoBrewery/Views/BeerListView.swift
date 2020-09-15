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
    
    var body: some View {
        NavigationView {
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
            }
            .background(AppColor.background.color)
            .navigationBarTitle(viewModel.titleText, displayMode: .inline)
        }
    }
}


struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView(viewModel: BeerListViewModel())
    }
}
