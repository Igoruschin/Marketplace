//
//  extension.swift
//  Marketplace
//
//  Created by Игорь Ущин on 14.06.2022.
//

import Foundation


extension String{
    
    enum ValidTypes{
        case name
        case email
        case password
    }
    
    enum Regular: String{
        case name = "[а-яА-Я]{1,}" //фильтрация имени,фамилии и т.д
        case email = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"//фильтрация почты
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"//для пароля
    }
    
    func isValid(validtypes: ValidTypes) -> Bool{
        let format = "SELF MATCHES %@"
        var regular = ""
        
        switch validtypes {
            case .name: regular = Regular.name.rawValue
            case .email: regular = Regular.email.rawValue
            case .password: regular = Regular.password.rawValue
        }
        return NSPredicate(format: format, regular).evaluate(with: self)
        
    }
}
