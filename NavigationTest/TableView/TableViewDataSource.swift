//
//  TableViewDataSource.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource{
        
        var viewModel: TableViewModelProtocol!
    
    
        func register(tableView: UITableView){
            tableView.register(ExampleCell.self, forCellReuseIdentifier: "cell")
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.itemsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExampleCell
            
            cell.configure(model: viewModel.itemsArray[indexPath.row])
            
            return cell
        }
}
