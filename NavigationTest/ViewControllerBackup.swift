//
//  ViewControllerBackup.swift
//  NavigationTest
//
//
//  ViewController.swift/Users/gparaiso/Documents/NavigationTest/NavigationTest/ViewControllerBackup.swift
//  NavigationTest
//
//  Created by Paraíso, Gustavo Alexandre on 04/05/2023.
//

import UIKit
/*
class ViewController: UIViewController {
    private let btn = UIButton(frame: .zero)
    private let btn2 = UIButton(frame: .zero)
    private let tableView = UITableView(frame: .zero)
    private var itemsArray:[Item] = []
    //private let viewController2 = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(btn)
        btn.setTitle("Push", for: [])
        btn.translatesAutoresizingMaskIntoConstraints = false

        // Do any additional setup after loading the view.
        btn.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //btn2
        btn2.setTitle("Present", for: [])
        btn2.backgroundColor = .blue
        btn.backgroundColor = .blue
        btn2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn2)
        btn2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn2.leadingAnchor.constraint(equalTo: btn.trailingAnchor, constant: 10).isActive = true
        btn2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
        btn2.addTarget(self, action: #selector(btnHandler2), for: .touchUpInside)
        
        
        //table view
        view.addSubview(tableView)
        //tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.register(ExampleCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
        itemsArray = getApiItems()
        
        
    }
    
    @objc func btnHandler(){
        
        self.navigationController?.pushViewController(ViewController2(), animated: true)
        
    }

    @objc func btnHandler2(){
        
        self.present(ViewController2(), animated: true)
        
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

}

struct CellViewModel {
    var text: String
    var color: UIColor
}

let cells = [CellViewModel(text: "Blue", color: .blue),
             CellViewModel(text: "Red", color: .red),
             CellViewModel(text: "Green", color: .green) ]

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExampleCell
        
        cell.configure(model: cells[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0: self.navigationController?.pushViewController(ViewController2(), animated: true)
        case 1: self.navigationController?.pushViewController(ViewController3(), animated: true)
        case 2: self.navigationController?.pushViewController(Blue(), animated: true)
        default: break
        }
        print(itemsArray)

        
    }
}


*/
