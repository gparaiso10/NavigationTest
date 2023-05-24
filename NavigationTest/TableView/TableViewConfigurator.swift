//
//  TableViewConfigurator.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit


class TableViewConfigurator{

    
    func build() -> UIViewController{
        
        let vc = ViewController()
        let vm = TableViewModel()
        let dataSource = TableViewDataSource()
        let delegate = TableViewDelegate()
        let coordinator = TableViewCoordinator()
        
        let singleVC = SingleItemViewConfigurator().build()
        
        vc.viewModel = vm
        vc.delegate = delegate
        vc.dataSource = dataSource
        
        dataSource.viewModel = vm
        delegate.viewModel = vm
        coordinator.viewController = vc
        delegate.viewCoordinator = coordinator
        
        delegate.singleItemViewModel = singleVC.vm
        coordinator.singleItemViewController = singleVC as? UIViewController
        
        return vc
    }
    
}
