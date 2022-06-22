//
//  ProfileUserController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 02.06.2022.
//

import UIKit

class ProfileUserController: UIViewController {
    
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "empty")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstNameLabel: UILabel = {
            let label = UILabel()
            label.text = "First Name"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let secondNameLabel: UILabel = {
            let label = UILabel()
            label.text = "Second Name"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let ageLabel: UILabel = {
            let label = UILabel()
            label.text = "Age"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let phoneLabel: UILabel = {
            let label = UILabel()
            label.text = "Phone"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let emailLabel: UILabel = {
            let label = UILabel()
            label.text = "Email"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "Password"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    

        private var stackView = UIStackView()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupViews()
            setConstraints()
            setModel()
        }
        
        private func setupViews() {
            title = "Профиль"
            view.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)

            stackView = UIStackView(arrangedSubviews: [firstNameLabel,
                                                       secondNameLabel,
                                                       ageLabel,
                                                       phoneLabel,
                                                       emailLabel,
                                                       passwordLabel])
            view.addSubview(imageView)
            view.addSubview(stackView)
            stackView.axis = .vertical
            stackView.spacing = 15
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
        }

    private func setModel() {
        guard let activeUser = DataBase.shared.activeUser else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: activeUser.age)
        
        firstNameLabel.text = activeUser.firstName
        secondNameLabel.text = activeUser.secondName
        phoneLabel.text = activeUser.phone
        emailLabel.text = activeUser.email
        passwordLabel.text = activeUser.password
        ageLabel.text = dateString
        }
    }

    //MARK: - SetConstraints
    extension ProfileUserController {
        
        private func setConstraints() {

            NSLayoutConstraint.activate([
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
                imageView.widthAnchor.constraint(equalToConstant: 170),
                imageView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }
    }


