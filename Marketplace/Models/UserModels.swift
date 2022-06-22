//
//  UserModels.swift
//  Marketplace
//
//  Created by Игорь Ущин on 01.06.2022.
//  
//

import Foundation


struct User: Codable {
    let firstName: String
    let secondName: String
    let phone: String
    let email: String
    let password: String
    let age: Date
}
