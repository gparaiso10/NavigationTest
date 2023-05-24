//
//  ViewController.swift
//  NavigationTest
//
//  Created by Paraíso, Gustavo Alexandre on 04/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)

    var viewModel: TableViewModelProtocol!
    var dataSource: TableViewDataSource!
    var delegate: TableViewDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = dataSource
        viewModel.reloadData = reloadData
        dataSource.register(tableView: tableView)
        tableView.delegate = delegate
        viewModel.bind()
    }
        
     func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


