//
//  ExampleCell.swift
//  NavigationTest
//
//  Created by Paraíso, Gustavo Alexandre on 04/05/2023.
//

import UIKit

class ExampleCell: UITableViewCell{
 
    private let label = UILabel(frame: .zero)
    private let price = UILabel(frame: .zero)
    private let image = UIImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        print("new instance")
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.heightAnchor.constraint(equalToConstant: 400).isActive = true
        self.addSubview(label)
        self.addSubview(price)
        self.addSubview(image)
        
        price.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: price.leadingAnchor, constant: 5).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        price.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -350).isActive = true
        price.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -350).isActive = true
        
        price.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 5).isActive = true
        price.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: CellViewModel){
        label.text = viewModel.item.name
        price.text = "$\(viewModel.item.price)"
        image.load(url: viewModel.item.image)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
