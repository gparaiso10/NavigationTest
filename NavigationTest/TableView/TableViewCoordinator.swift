//
//  TableViewCoordinator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

protocol TableViewCoordinatorProtocol {
    var viewController: UIViewController! {get set}
    func pushSingleItemView(id: Int)
}

class TableViewCoordinator: UIViewController, TableViewCoordinatorProtocol {
    
    weak var viewController: UIViewController!
    
    func pushSingleItemView(id: Int){
        let singleController = SingleItemViewConfigurator().build(id: id)
        
        viewController.navigationController?.pushViewController(singleController, animated: true)
    }
    
}
