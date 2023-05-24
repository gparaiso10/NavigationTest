//
//  SingleItemViewConfigurator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 24/05/2023.
//

import UIKit

class SingleItemViewConfigurator {
    
    func build() -> SingleItemViewControllerProtocol{
        let singleItemVC = SingleItemViewController()
        let singleItemVM = SingleItemViewModel()
        
        singleItemVC.vm = singleItemVM
        
        return singleItemVC
    }
    
}
