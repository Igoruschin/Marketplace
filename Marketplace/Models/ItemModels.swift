//
//  ItemModels.swift
//  Marketplace
//
//  Created by Игорь Ущин on 20.06.2022.
//

import Foundation
import UIKit

struct ItemModels {
    var image: UIImage
    var nameItems: String
    var smallDescription: String
    var cost: Int
    
    static func fetchItems() -> [ItemModels] {
        let item1 = ItemModels(image: UIImage(named: "item1")!,nameItems: "Чехол для планшета",smallDescription:"Аксессуары",cost: 789)
        let item2 = ItemModels(image: UIImage(named: "item2")!, nameItems: "Робот-пылесос", smallDescription: "Техника", cost: 3790)
        let item3 = ItemModels(image: UIImage(named: "item3")!, nameItems: "Блендер", smallDescription: "Техника", cost: 2500)
        let item4 = ItemModels(image: UIImage(named: "item4")!, nameItems: "Кофемашина", smallDescription: "Техника", cost: 13549)
        let item5 = ItemModels(image: UIImage(named: "item5")!, nameItems: "Микроволновка", smallDescription: "Техника", cost: 5600)
        let item6 = ItemModels(image: UIImage(named: "item6")!, nameItems: "Холодильник для вина", smallDescription: "Техника", cost: 31200)
        let item7 = ItemModels(image: UIImage(named: "item7")!, nameItems: "Ручной блендер", smallDescription: "Техника", cost: 1990)
        let item8 = ItemModels(image: UIImage(named: "item8")!, nameItems: "Тостер", smallDescription: "Техника", cost: 2700)
        let item9 = ItemModels(image: UIImage(named: "item9")!, nameItems: "Ручной Пылесос", smallDescription: "Техника", cost: 15640)
        let item10 = ItemModels(image: UIImage(named: "item10")!, nameItems: "Стакан", smallDescription: "Аксессуары", cost: 500)
        let item11 = ItemModels(image: UIImage(named: "item11")!, nameItems: "Гриль", smallDescription: "Техника", cost: 5500)
        let item12 = ItemModels(image: UIImage(named: "item12")!, nameItems: "Мини-печь", smallDescription: "Техника", cost: 10500)
        let item13 = ItemModels(image: UIImage(named: "item13")!, nameItems: "Очки", smallDescription: "Аксессуары", cost: 1500)
        let item14 = ItemModels(image: UIImage(named: "item14")!, nameItems: "Бумажник", smallDescription: "Аксессуары", cost: 350)
        
        return [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14]
    }
}
struct Const{
    static let leftDist: CGFloat = 8
    static let rightDist: CGFloat =  17
    static let leftDist2: CGFloat = 40
    static let rightDist2: CGFloat =  40
    static let gallerySpacing: CGFloat = 5
    static let galleryHeight = (UIScreen.main.bounds.height - Const.leftDist2 - Const.rightDist2 - (Const.gallerySpacing / 2)) / 2
    static let galleryWidth = (UIScreen.main.bounds.width - Const.leftDist - Const.rightDist - (Const.gallerySpacing / 2)) / 2
}
