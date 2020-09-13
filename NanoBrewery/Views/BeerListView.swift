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
        ScrollView {
            LazyVStack {
                ForEach(viewModel.beerList, id: \.id) { beer in
                    BeerListCellView(viewModel: BeerListCellViewModel(beer: beer))
                }
            }
            .background(AppColor.background.color)
        }
    }
}


struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView(viewModel: BeerListViewModel())
    }
}