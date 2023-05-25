//
//  TableViewDelegate.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate{
    
    var viewModel: TableViewModelProtocol!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.presentDetails(id: viewModel.cells[indexPath.row].item.id)
    }
}
