//
//  TableViewModel.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

protocol TableViewModelProtocol {
    var reloadData: () -> Void { get set }
    var itemsArray: [Item] { get }
    func bind() -> Void
}

class TableViewModel: TableViewModelProtocol{
    var reloadData: () -> Void = { }
    
    var itemsArray: [Item] = []
    
    func bind(){
        
        let network = Network(
            host: "cf5dxst1y4.execute-api.eu-west-1.amazonaws.com",
            path: "/develop/product",
            hasKey: true,
            apiKey: "I2tgdBezVY5rakqSWB3eo1Q8V8Sk0myg7rkYQFBV")
        
        network.searchNetwork(search: "") {[weak self] products in
            if let products = products {
                self?.itemsArray = products
                self?.reloadData()
                
            }
        }
    }
    
}
