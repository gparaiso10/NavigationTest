//
//  TableViewModel.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import Foundation

protocol TableViewModelProtocol {
    var reloadData: () -> Void { get set }
    var cells: [ExampleCellModelProtocol] { get set }
    func bind() -> Void
    func presentDetails(id: Int)
}

class TableViewModel: TableViewModelProtocol{
    
    var coordinator: TableViewCoordinatorProtocol!
    
    func presentDetails(id: Int) {
        bind()
        coordinator.pushSingleItemView(id: id)
    }
    
    var reloadData: () -> Void = { }
    
    var cells: [ExampleCellModelProtocol] = []
    
    func bind(){
        
        let network = Network(
            host: "cf5dxst1y4.execute-api.eu-west-1.amazonaws.com",
            path: "/develop/product",
            hasKey: true,
            apiKey: "I2tgdBezVY5rakqSWB3eo1Q8V8Sk0myg7rkYQFBV")
        
        network.searchNetwork(search: "") {[weak self] products in
            if let products = products {
                self?.cells = products.map{ product in
                    CellViewModel(item: product)
                }
                self?.reloadData()
                
            }
        }
    }
    
}
