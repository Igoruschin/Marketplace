//
//  ViewController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 01.06.2022.
//

import UIKit

  class ViewController: UIViewController {
      
      private var myImageView: UIImageView = {
          var imageView = UIImageView()
          let myImage = UIImage(named: "ViewController")
          imageView = UIImageView(image: myImage)
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
      }()
    
      private lazy var enterButton:UIButton = {
          let button = UIButton()
          button.setTitle("Вход", for: .normal)
          button.layer.cornerRadius = 10
          button.backgroundColor = #colorLiteral(red: 0.1353955865, green: 0.1372428834, blue: 0.3925223947, alpha: 1)
          button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
          button.setTitleColor(.white, for: .normal)
          button.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
          button.translatesAutoresizingMaskIntoConstraints = false
          button.addTarget(self, action: #selector(pressBut(sender:)), for: .touchUpInside)
          return button
      }()
    
      private lazy var signButton:UIButton = {
          let button = UIButton()
          button.layer.cornerRadius = 10
          button.translatesAutoresizingMaskIntoConstraints = false
          button.backgroundColor = .systemGreen
          button.setTitle("Зарегистрироваться", for: .normal)
          button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
          button.setTitleColor(.black, for: .normal)
          button.setTitleColor(.white, for: .highlighted)
          button.addTarget(self, action: #selector(buttonSignIn(sender:)), for: .touchUpInside)
          return button
      }()

      private var logField:UITextField = {
          let login = UITextField()
          login.borderStyle = .roundedRect
          login.placeholder = "Логин"
          login.backgroundColor = .systemGray5
          login.translatesAutoresizingMaskIntoConstraints = false
          return login
      }()
      
      private let passField:UITextField = {
          let password = UITextField()
          password.borderStyle = .roundedRect
          password.backgroundColor = .systemGray5
          password.placeholder = "Пароль"
          password.isSecureTextEntry = true
          password.clearsOnBeginEditing = true
          password.translatesAutoresizingMaskIntoConstraints = false
          return password
      }()
    
      private let lb1: UILabel = {
          let label = UILabel()
          label.textColor = #colorLiteral(red: 0.6264176369, green: 0.7572597861, blue: 0.8323677182, alpha: 1)
          label.text = "Логин"
          label.font = .systemFont(ofSize: 21, weight: .medium)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      private let lb2: UILabel = {
          let label = UILabel()
          label.textColor = #colorLiteral(red: 0.6264176369, green: 0.7572597861, blue: 0.8323677182, alpha: 1)
          label.text = "Пароль"
          label.font = .systemFont(ofSize: 21, weight: .medium)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      private let lb3: UILabel = {
          let label = UILabel()
          label.textColor = #colorLiteral(red: 0.1353955865, green: 0.1372428834, blue: 0.3925223947, alpha: 1)
          label.text = "Авторизуйтесь"
          label.textAlignment = .center
          label.font = .systemFont(ofSize: 28, weight: .heavy)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
      private let registrLabel: UILabel = {
          let label = UILabel()
          label.textColor = #colorLiteral(red: 0.6264176369, green: 0.7572597861, blue: 0.8323677182, alpha: 1)
          label.text = "Создайте новый аккаунт."
          label.textAlignment = .center
          label.font = .systemFont(ofSize: 18, weight: .regular)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
 
      private var stackView = UIStackView()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAllViews()
        setConstraints()
       
    }
    private  func setAllViews(){
        
          view.addSubview(myImageView)
          view.addSubview(signButton)
          view.addSubview(registrLabel)
          
          stackView = UIStackView(arrangedSubviews: [lb3,
                                                     lb1,
                                                     logField,
                                                     lb2,
                                                     passField])
        
          view.addSubview(stackView)
          view.addSubview(enterButton)
          stackView.axis = .vertical
          stackView.spacing = 2
          stackView.distribution = .fillEqually
          stackView.translatesAutoresizingMaskIntoConstraints = false
          
          self.navigationItem.backButtonTitle = "Выйти"
      }
    //MARK: - method
      private func findUsersData(mail: String) -> User?{
          let dataBase = DataBase.shared.users
        
          for user in dataBase{
              if user.email == mail{
                  return user
              }
          }
          return nil
      }
      
    @objc func pressBut(sender: Any){
        
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        let profileVC = UINavigationController(rootViewController: ProfileUserController())
        let basketVC = UINavigationController(rootViewController: BasketViewController())
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.backgroundColor = .init(white: 0.8, alpha: 0.6)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        secondVC.tabBarItem.image = UIImage(systemName: "doc.text.magnifyingglass")
        secondVC.title = "Каталог"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        profileVC.title = "Профиль"
        basketVC.tabBarItem.image = UIImage(systemName: "cart.fill.badge.plus")
        basketVC.title = "Корзина"
        
        let mail = logField.text ?? ""
        let password = passField.text ?? ""
        let user = findUsersData(mail: mail)
        
        if user == nil {
            alert(title: "Ошибка", message: "Неверный логин!", style: .alert)
        }else if user?.password == password{
            
            tabBarVC.setViewControllers([secondVC, profileVC, basketVC], animated: false)
            present(tabBarVC, animated: true)
            
            guard let activeUser = user else {return}
            DataBase.shared.saceActiveUser(user: activeUser)
        }else {
            alert(title: "Ошибка", message: "Неверный пароль!", style: .alert)
        }
       
    }
      @objc func buttonSignIn(sender: Any){
         let menuVC = MenuViewController()
          self.navigationController?.pushViewController(menuVC, animated: true)
      }
  }
//MARK: - SetConstraints
extension ViewController{
    func setConstraints(){
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: view.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            signButton.bottomAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: -60),
            signButton.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
            signButton.heightAnchor.constraint(equalToConstant: 40),
            signButton.widthAnchor.constraint(equalToConstant: 240)
        ])
        NSLayoutConstraint.activate([
            enterButton.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
            enterButton.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
            
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            enterButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
           stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           stackView.topAnchor.constraint(equalTo: enterButton.bottomAnchor,constant: -280),
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -70),
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 70)
        ])
        NSLayoutConstraint.activate([
           registrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           registrLabel.topAnchor.constraint(equalTo: signButton.bottomAnchor,constant: 5)
        ])
    }
}
