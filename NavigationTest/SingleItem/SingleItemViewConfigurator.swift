//
//  SingleItemViewConfigurator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 24/05/2023.
//

import UIKit

class SingleItemViewConfigurator {
    
    func build(id: Int) -> UIViewController{
        let singleItemVC = SingleItemViewController()
        let singleItemVM = SingleItemViewModel(index: id)
        
        singleItemVC.vm = singleItemVM
        
        return singleItemVC
    }
    
}
