//
//  TableViewCoordinator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

class TableViewCoordinator: UIViewController {
    
    weak var viewController: UIViewController!
    var singleItemViewController: UIViewController!
    
    func pushSingleItemView(){
        viewController.navigationController?.pushViewController(singleItemViewController, animated: true)
    }
    
}
