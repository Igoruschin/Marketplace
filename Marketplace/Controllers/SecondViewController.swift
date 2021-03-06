//
//  SecondViewController.swift
//  Marketplace
//
//  Created by Игорь Ущин on 02.06.2022.
//

import UIKit


class SecondViewController: UIViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var catalogCollection = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(catalogCollection)
        setupSearchController()
        setupDelegate()
        setNavigationBar()
        setConstraints()
        catalogCollection.set(cells: ItemModels.fetchItems())
        
    }
    //MARK: - createButtons,NavigationsSearch
    private func createCustomButton(selector: Selector) -> UIBarButtonItem{
           let button = UIButton(type: .system)
           button.setImage(UIImage(systemName: "arrowshape.turn.up.left.circle.fill"), for: .normal)
           button.tintColor = .black
           button.addTarget(self, action: selector, for: .touchUpInside)
           let menuBarItem = UIBarButtonItem(customView: button)
           return menuBarItem
       }
    
    private func setNavigationBar() {
           navigationItem.title = "Каталог"
           navigationItem.searchController = searchController
           let userInfoButton = createCustomButton(selector: #selector(getOutPressButton))
           navigationItem.leftBarButtonItem = userInfoButton
        
          self.view.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
       }
    
    //MARK: - Methods,setSearchController
    private func setupDelegate() {
           searchController.searchBar.delegate = self
       }
    private func setupSearchController() {
        searchController.searchBar.placeholder = "Поиск"
        searchController.obscuresBackgroundDuringPresentation = false
        // searchController.searchResultsUpdater = self
        definesPresentationContext = true
        //scopeBar
        searchController.searchBar.scopeButtonTitles = ["Все", "Аксессуары", "Техника"]
        searchController.searchBar.delegate = self
       }

    @objc private func getOutPressButton() {
        alert(title: "Внимание", message: "Вы точно хотите выйти?", style: .alert)
        }
  }

//MARK: - UISearchBarDelegate
extension SecondViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
//MARK: - SetConstraints
extension SecondViewController{
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            catalogCollection.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            catalogCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            catalogCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            catalogCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8)
        ])
    }
}
