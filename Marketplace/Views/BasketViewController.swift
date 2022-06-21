//
//  ThirdViewController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 02.06.2022.
//

import UIKit

class BasketViewController: UIViewController {
    
    
                          
    private let phoneValidLabel1: UILabel = {
        let label = UILabel()
        label.text = "nishtak"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneValidLabel2: UILabel = {
        let label = UILabel()
        label.text = "zaebok"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneValidLabel3: UILabel = {
        let label = UILabel()
        label.text = "top4ik"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myImageView: UIImageView = {
        var myImageView = UIImageView()
        let myImage = UIImage(named: "cafe3")
        myImageView = UIImageView(image: myImage)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("SignUP", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  private var elementsStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myStackView()
        Constraints()
    }
    private func myStackView(){
        elementsStack = UIStackView(arrangedSubviews: [phoneValidLabel3,signUpButton,phoneValidLabel2,phoneValidLabel1])
        elementsStack.axis = .vertical
        elementsStack.spacing = 20
        elementsStack.distribution = .fillEqually
        view.addSubview(myImageView)
        myImageView.addSubview(elementsStack)
        elementsStack.translatesAutoresizingMaskIntoConstraints = false
    }
}
extension BasketViewController{
    
    private func Constraints(){
        NSLayoutConstraint.activate([
            elementsStack.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
            elementsStack.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
          
            ])
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: view.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
}

