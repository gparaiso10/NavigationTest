//
//  ViewController.swift
//  NavigationTest
//
//  Created by Paraíso, Gustavo Alexandre on 04/05/2023.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView(frame: .zero)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //table view
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.register(ExampleCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
        
        
    }
    
}

func getApiItems() -> [Item]{
    let dispatchGroup = DispatchGroup()
    var myArray:[Item] = []

    let network = Network(
     host: "cf5dxst1y4.execute-api.eu-west-1.amazonaws.com",
     path: "/develop/product",
     hasKey: true,
     apiKey: "I2tgdBezVY5rakqSWB3eo1Q8V8Sk0myg7rkYQFBV")

    dispatchGroup.enter()


    network.searchNetwork(search: "") { items in
        myArray = items
        dispatchGroup.leave()
        
    }

    dispatchGroup.wait()

    return myArray
}


let itemsArray = getApiItems()

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExampleCell
        
        cell.configure(model: itemsArray[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(SingleItemView(item: itemsArray[indexPath.row] ), animated: true)        
    }
}

