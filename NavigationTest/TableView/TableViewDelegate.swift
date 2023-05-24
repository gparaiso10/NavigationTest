//
//  TableViewDelegate.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate{
    
    var viewModel: TableViewModel!
    var viewCoordinator: TableViewCoordinator!
    var singleItemViewModel: SingleItemViewModelProtocol!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        singleItemViewModel.bindSingleItem(index: viewModel.itemsArray[indexPath.row].id)
        viewCoordinator.pushSingleItemView()
    }
}
