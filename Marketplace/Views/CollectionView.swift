//
//  CollectionView.swift
//  Marketplace
//
//  Created by Игорь Ущин on 20.06.2022.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    var cells = [ItemModels]()
    
        init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
            backgroundColor = .white
            delegate = self
            dataSource = self
            register(GalleryCollectionCell.self, forCellWithReuseIdentifier: GalleryCollectionCell.reuseId)
            
            translatesAutoresizingMaskIntoConstraints = false
            showsVerticalScrollIndicator = false
            
    }
    func set(cells: [ItemModels]){
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionCell.reuseId, for: indexPath) as! GalleryCollectionCell
        cell.imageView.image = cells[indexPath.row].image
        cell.nameLabel.text = cells[indexPath.row].nameItems
        cell.smallDescriptionLabel.text = cells[indexPath.row].smallDescription
        cell.costLabel.text = "₽\(cells[indexPath.row].cost)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Const.galleryWidth, height: Const.galleryHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
