//
//  SingleItemViewController.swift
//  APITableView
//
//  Created by Paraíso, Gustavo Alexandre on 22/05/2023.
//

import UIKit

class SingleItemViewController: UIViewController {
    let idLabel = UILabel(frame: .zero)
    let genderLabel = UILabel(frame: .zero)
    let nameLabel = UILabel(frame: .zero)
    let priceLabel = UILabel(frame: .zero)
    let descriptionLabel = UILabel(frame: .zero)
    let colorsTable = UILabel(frame: .zero)
    let sizesTable = UILabel(frame: .zero)
    
    var vm: SingleItemViewModelProtocol?
    
    let margin: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraints()
        vm?.reloadData = reloadData
    }
    
    func addSubviews(){
        view.backgroundColor = .white
        
        view.addSubview(idLabel)
        view.addSubview(genderLabel)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(colorsTable)
        view.addSubview(sizesTable)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        colorsTable.translatesAutoresizingMaskIntoConstraints = false
        sizesTable.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setupConstraints(){
        // idLabel constraints
        idLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        // genderLabel constraints
        genderLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: margin).isActive = true
        genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // nameLabel constraints
        nameLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: margin).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        // priceLabel constraints
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: margin).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        // colorsTable constraints
        colorsTable.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: margin).isActive = true
        colorsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        colorsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        // sizesTable constraints
        sizesTable.topAnchor.constraint(equalTo: colorsTable.bottomAnchor, constant: margin).isActive = true
        sizesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        sizesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        // descriptionLabel constraints
        descriptionLabel.topAnchor.constraint(equalTo: sizesTable.bottomAnchor, constant: margin).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        
        descriptionLabel.numberOfLines = 0
        sizesTable.numberOfLines = 0
        colorsTable.numberOfLines = 0
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.idLabel.text = "Id: \(self.vm?.itemSingular?.id ?? 0)"
            self.genderLabel.text = "Gender: \(self.vm?.itemSingular?.gender ?? "")"
            self.nameLabel.text = "Name: \(self.vm?.itemSingular?.name ?? "")"
            self.priceLabel.text = "Price: $\(self.vm?.itemSingular?.price ?? 0.0)"
            self.descriptionLabel.text = "Description: \(self.vm?.itemSingular?.description ?? "")"
            self.sizesTable.text = "\(self.vm?.itemSingular?.availableSizes ?? [])"
            self.colorsTable.text = "\(self.vm?.itemSingular?.availableColors ?? [])"
        }
    }
}

