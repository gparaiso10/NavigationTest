//
//  SingleItemViewModel.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 22/05/2023.
//

import UIKit

protocol SingleItemViewModelProtocol {
    var itemSingular: ItemSingular? {get set}
    //func bindSingleItem(index: Int)
    var reloadData: () -> Void {get set}
}

class SingleItemViewModel: SingleItemViewModelProtocol{
    
    var itemSingular: ItemSingular?
    
    init(index: Int){
            
            let network = Network(
                host: "cf5dxst1y4.execute-api.eu-west-1.amazonaws.com",
                path: "/develop/product/\(index)",
                hasKey: true,
                apiKey: "I2tgdBezVY5rakqSWB3eo1Q8V8Sk0myg7rkYQFBV")

            network.getNetworkItem() {[weak self] products in
                if let products = products {
                    self?.itemSingular = products
                    self?.reloadData()
                }
            }
        }
    
    var reloadData: () -> Void = {}
    
}
