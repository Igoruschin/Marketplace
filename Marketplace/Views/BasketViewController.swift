//
//  ThirdViewController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 02.06.2022.
//

import UIKit

class BasketViewController: UIViewController {
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = "Общая стоимость:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "₽"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myImageView: UIImageView = {
        var myImageView = UIImageView()
        let myImage = UIImage(named: "basket")
        myImageView = UIImageView(image: myImage)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    private let basketBuyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Оформить заказ", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Отмена", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
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
        navigationItem.title = "Корзина"
        self.view.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        
        elementsStack = UIStackView(arrangedSubviews: [costLabel,priceLabel])
        elementsStack.axis = .horizontal
        elementsStack.spacing = 15
        elementsStack.distribution = .fillProportionally
        
        view.addSubview(basketBuyButton)
        view.addSubview(elementsStack)
        view.addSubview(cancelButton)
        view.addSubview(myImageView)
        elementsStack.translatesAutoresizingMaskIntoConstraints = false
    }
}
//MARK: - SetConstraints
extension BasketViewController{
    
    private func Constraints(){
        
        NSLayoutConstraint.activate([
            elementsStack.topAnchor.constraint(equalTo: cancelButton.bottomAnchor,constant: -75),
            elementsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
             
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 120),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            basketBuyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            basketBuyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            basketBuyButton.widthAnchor.constraint(equalToConstant: 230),
            basketBuyButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
       
    }
}

