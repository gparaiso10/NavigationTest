//
//  SingleItemView.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 11/05/2023.
//

import UIKit


class SingleItemView: UIViewController {
    //private let btn = UIButton(frame: .zero)
    private let item:Item
    private let idLabel = UILabel(frame: .zero)
    private let genderLabel = UILabel(frame: .zero)
    private let nameLabel = UILabel(frame: .zero)
    private let imageView = UIImageView(frame: .zero)
    private let priceLabel = UILabel(frame: .zero)
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(btn)
        view.backgroundColor = .white
//        btn.setTitle("Go back", for: [])
//        btn.setTitleColor(.black, for: [])
//        btn.translatesAutoresizingMaskIntoConstraints = false

        // Do any additional setup after loading the view.
//        btn.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
//        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
//        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        
        view.addSubview(idLabel)
        view.addSubview(genderLabel)
        view.addSubview(nameLabel)
        view.addSubview(imageView)
        view.addSubview(priceLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        //id
        idLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idLabel.text = "Id: \(item.id)"
        
        //gender
        genderLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 10).isActive = true
        genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genderLabel.text = "Gender: \(item.gender)"
        
        //name
        nameLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.text = "Name: \(item.name)"

        //price
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceLabel.text = "Price: $\(item.price)"
        
        //image
        imageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        imageView.load(url: item.image)
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    //@objc func btnHandler(){
    //    self.dismiss(animated: true)
        
    //}


}

