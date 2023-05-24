//
//  TableViewCoordinator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

protocol TableViewCoordinatorProtocol {
    var viewController: UIViewController! {get set}
    var singleItemViewController: UIViewController! {get set}
    func pushSingleItemView()
}

class TableViewCoordinator: UIViewController, TableViewCoordinatorProtocol {
    
    weak var viewController: UIViewController!
    var singleItemViewController: UIViewController!
    
    func pushSingleItemView(){
        viewController.navigationController?.pushViewController(singleItemViewController, animated: true)
    }
    
}
