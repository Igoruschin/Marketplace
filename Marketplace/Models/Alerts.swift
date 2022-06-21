//
//  Alerts.swift
//  Marketplace
//
//  Created by Игорь Ущин on 01.06.2022.
//  
//


import UIKit
import Foundation

extension ViewController{
    
    func alert(title: String, message: String, style: UIAlertController.Style){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Отмена", style: .destructive) { (action) in
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    }
}

extension SecondViewController{
    
  func alert(title: String, message: String, style: UIAlertController.Style){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Отмена", style: .destructive) { (action) in
    })
    let alertACT = UIAlertAction(title: "Да", style: .default) { (_) in
    
        let firstVC = UINavigationController(rootViewController: ViewController())
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true)
        
    }
      alert.addAction(alertACT)
    present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
    
    func alertOk(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Oк", style: .destructive)
        
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
}

extension MenuViewController{
    
  func alert(title: String, message: String, style: UIAlertController.Style){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertACT = UIAlertAction(title: "Ок", style: .default) { (_) in
        self.navigationController?.popViewController(animated: true)
    }
    alert.addAction(alertACT)
    present(alert, animated: true, completion: nil)
    }
}
