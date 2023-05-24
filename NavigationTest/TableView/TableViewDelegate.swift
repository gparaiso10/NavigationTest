//
//  TableViewDelegate.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 18/05/2023.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate{
    
    var viewModel: TableViewModelProtocol!
    var viewCoordinator: TableViewCoordinatorProtocol!
    var singleItemViewModel: SingleItemViewModelProtocol!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        singleItemViewModel.bindSingleItem(index: viewModel.itemsArray[indexPath.row].id)
        viewCoordinator.pushSingleItemView()
    }
}
