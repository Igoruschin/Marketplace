//
//  MenuViewController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 02.06.2022.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           return scrollView
       }()
       
       private let backgroundView: UIView = {
           let view = UIView()
           view.backgroundColor = .white
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       private let loginLabel: UILabel = {
           let label = UILabel()
           label.text = "Регистрация"
           label.font = .systemFont(ofSize: 18, weight: .regular)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let firstNameTextField: UITextField = {
           let textField = UITextField()
           textField.borderStyle = .roundedRect
           textField.placeholder = "Имя"
           return textField
       }()
       
       private let firstNameValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let secondNameTextField: UITextField = {
           let textField = UITextField()
           textField.borderStyle = .roundedRect
           textField.placeholder = "Фамилия"
           return textField
       }()
       
       private let secondNameValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let ageValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let phoneNumberTextField: UITextField = {
           let textField = UITextField()
           textField.borderStyle = .roundedRect
           textField.placeholder = "Номер телефона"
           textField.keyboardType = .numberPad
           return textField
       }()
       
       private let phoneValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let emailTextField: UITextField = {
           let textField = UITextField()
           textField.borderStyle = .roundedRect
           textField.placeholder = "Почта"
           return textField
       }()
       
       private let emailValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let passwordTextField: UITextField = {
           let textField = UITextField()
           textField.borderStyle = .roundedRect
           textField.isSecureTextEntry = true
           textField.placeholder = "Пароль"
           return textField
       }()
       
       private let passwordValidLabel: UILabel = {
           let label = UILabel()
           label.text = "Обязательно для заполнения*"
           label.textColor = .systemOrange
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private lazy var signUpButton: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = .systemGreen
           button.setTitle("Зарегистрироваться", for: .normal)
           button.setTitleColor(.black, for: .normal)
           button.setTitleColor(.white, for: .highlighted)
           button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
           button.layer.cornerRadius = 10
           button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
        private var elementsStackView = UIStackView()
        private let datePicker = UIDatePicker()
    
    let nameValid: String.ValidTypes = .name
    let emailValid: String.ValidTypes = .email
    let passwordValid: String.ValidTypes = .password
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              setupViews()
              setConstraints()
              setupDelegate()
              setupDataPicker()
        
          }
          
          private func setupViews() {
              self.view.addSubview(scrollView)
              scrollView.addSubview(backgroundView)
              
              elementsStackView = UIStackView(arrangedSubviews:  [firstNameTextField,
                                                                   firstNameValidLabel,
                                                                   secondNameTextField,
                                                                   secondNameValidLabel,
                                                                   datePicker,
                                                                   ageValidLabel,
                                                                   phoneNumberTextField,
                                                                   phoneValidLabel,
                                                                   emailTextField,
                                                                   emailValidLabel,
                                                                   passwordTextField,
                                                                   passwordValidLabel])
                                                
              
              backgroundView.addSubview(elementsStackView)
              backgroundView.addSubview(loginLabel)
              backgroundView.addSubview(signUpButton)
              elementsStackView.axis = .vertical
              elementsStackView.spacing = 10
              elementsStackView.distribution = .fillProportionally
              elementsStackView.translatesAutoresizingMaskIntoConstraints = false
              
          }
          
          private func setupDelegate() {
              firstNameTextField.delegate = self
              secondNameTextField.delegate = self
              phoneNumberTextField.delegate = self
              emailTextField.delegate = self
              passwordTextField.delegate = self
          }
          
          private func setupDataPicker() {
              datePicker.datePickerMode = .date
              datePicker.backgroundColor = .white
              datePicker.layer.borderColor = #colorLiteral(red: 0.8810099265, green: 0.8810099265, blue: 0.8810099265, alpha: 1)
              datePicker.layer.borderWidth = 1
              datePicker.clipsToBounds = true
              datePicker.layer.cornerRadius = 6
              datePicker.tintColor = .black
          }
          
    @objc func signUpButtonTapped(){
              let firstNameText = firstNameTextField.text ?? ""
              let secondNameText = secondNameTextField.text ?? ""
              let emailText = emailTextField.text ?? ""
              let passwordText = passwordTextField.text ?? ""
              let phoneText = phoneNumberTextField.text ?? ""
              
              if firstNameText.isValid(validtypes: nameValid)
                    && secondNameText.isValid(validtypes: nameValid)
                    && emailText.isValid(validtypes: emailValid)
                    && passwordText.isValid(validtypes: passwordValid)
                    && phoneText.count == 18{
                  
                  DataBase.shared.saveUser(firstName: firstNameText,
                                           secondName: secondNameText,
                                           phone: phoneText,
                                           email: emailText,
                                           password: passwordText,
                                           age: datePicker.date)
                  alert(title: "Готово", message: "Аккаунт успешно создан", style: .alert)
                  print(DataBase.shared.users)
              }else{
                  alertOk(title: "Ошибка", message: "Не все поля заполнены")
              }
          }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange){
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        }else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validtypes: validType){
            label.text = validMessage
            label.textColor = .systemGreen
        }else{
            label.text = wrongMessage
            label.textColor = .systemRed
        }
    }
    private func  setPhoneNubmerMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String{
        let text = textField.text ?? ""
        
        let phone = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex{
            if character == "X"{
                result.append(number[index])
                index = number.index(after: index)
            }else{
                result.append(character)
            }
        }
        if result.count == 18{
            phoneValidLabel.text = "Корректно"
            phoneValidLabel.textColor = .systemGreen
        }else{
            phoneValidLabel.text = "+7..."
            phoneValidLabel.textColor = .systemRed
        }
        return result
    }
}


      //MARK: - UITextFieldDelegate
      extension MenuViewController: UITextFieldDelegate {
          
          func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
              
              switch textField {
                 case firstNameTextField:
                                   setTextField(textField: firstNameTextField,
                                   label: firstNameValidLabel,
                                   validType: nameValid,
                                   validMessage: "Корректно",
                                   wrongMessage: "Только А-Я буквы,минимум 1 символ",
                                   string: string,
                                   range: range)
                  case secondNameTextField:
                                 setTextField(textField: secondNameTextField,
                                 label: secondNameValidLabel,
                                 validType: nameValid,
                                 validMessage: "Корректно",
                                 wrongMessage: "Только А-Я буквы,минимум 1 символ",
                                 string: string,
                                 range: range)
                  case emailTextField:
                                 setTextField(textField: emailTextField,
                                 label: emailValidLabel,
                                 validType: emailValid,
                                 validMessage: "Почта корректна",
                                 wrongMessage: "Почта не корректна",
                                 string: string,
                                 range: range)
                  case passwordTextField:
                                 setTextField(textField: passwordTextField,
                                 label: passwordValidLabel,
                                 validType: passwordValid,
                                 validMessage: "Корректно",
                                 wrongMessage: "Минимум 6 символов, 1 заглавную и 1 цифру",
                                 string: string,
                                 range: range)
                  case phoneNumberTextField:
                      phoneNumberTextField.text =
                      setPhoneNubmerMask(
                      textField: phoneNumberTextField,
                      mask: "+X (XXX) XXX-XX-XX",
                      string: string,
                      range: range)
                  default:
                      break
              }
              
              return false
          }
          
          func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              firstNameTextField.resignFirstResponder()
              secondNameTextField.resignFirstResponder()
              emailTextField.resignFirstResponder()
              passwordTextField.resignFirstResponder()
              return true
          }
      }

      //MARK: - SetConstraints
      extension MenuViewController {
          
          private func setConstraints() {
              
              NSLayoutConstraint.activate([
                  scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                  scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                  scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                  scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
              ])
              
              NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: -90),
                  backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                  backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
                  backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
              ])
              
              NSLayoutConstraint.activate([
                  elementsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                  elementsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
                  elementsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
                  elementsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
              ])
              
              NSLayoutConstraint.activate([
                  loginLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                  loginLabel.bottomAnchor.constraint(equalTo: elementsStackView.topAnchor, constant: -30),
              ])
              
              NSLayoutConstraint.activate([
                  signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  signUpButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -60),
                  signUpButton.heightAnchor.constraint(equalToConstant: 40),
                  signUpButton.widthAnchor.constraint(equalToConstant: 240)
              ])
        
    }
}
