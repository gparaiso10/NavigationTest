//
//  CellViewModel.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 25/05/2023.
//

import Foundation

protocol CellModelProtocol {
    
}

protocol ExampleCellModelProtocol: CellModelProtocol {
    var item: Item { get set }
}

class CellViewModel: ExampleCellModelProtocol{
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
}
