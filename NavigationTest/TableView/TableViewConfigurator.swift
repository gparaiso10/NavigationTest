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
        
        vc.viewModel = vm
        vc.delegate = delegate
        vc.dataSource = dataSource
        
        vm.coordinator = coordinator
        
        dataSource.viewModel = vm
        delegate.viewModel = vm
        coordinator.viewController = vc
        
        
        return vc
    }
    
}
