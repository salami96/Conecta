//
//  FeedViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 05/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
    
    
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    var interesses = [Interesses]()
    var interessesFiltrados = [Interesses]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    fileprivate func criacaoDeUsuarios() {
        //criarInteresse(titulo: "teste")
        criarUsuario(email: "clark@email.com", senha: "123", nome: "Clark" , sobrenome: "Andrews", telefone: "5199997777", avatar: "avatar01")
        criarUsuario(email: "olivia@email.com", senha: "123", nome: "Olivia", sobrenome: "Jones", telefone: "5188997766", avatar: "avatar02")
        criarUsuario(email: "john@email.com", senha: "123", nome: "John", sobrenome: "Stuart", telefone: "5133335555", avatar: "avatar03")
        criarUsuario(email: "mariana@email.com", senha: "123", nome: "Mariana", sobrenome: "Almeida", telefone: "5188883333", avatar: "avatar04")
        criarUsuario(email: "matheus@email.com", senha: "123", nome: "Matheus", sobrenome: "Soares", telefone: "5177773333", avatar: "avatar05")
        criarUsuario(email: "jessica@email.com", senha: "123", nome: "Jessica", sobrenome: "Oliveira", telefone: "5144442222", avatar: "avatar06")
        criarUsuario(email: "antonio@email.com", senha: "123", nome: "Antonio", sobrenome: "Moraes", telefone: "5144449999", avatar: "avatar07")
        criarUsuario(email: "sophia@email.com", senha: "123", nome: "Sophia", sobrenome: "Barbosa", telefone: "5122224444", avatar: "avatar10")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "O que quer aprender ou ensinar?"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = true
        table.dataSource = self
        table.delegate = self
        searchController.searchBar.scopeButtonTitles = ["Todos", "Aprender", "Ensinar"]
        searchController.searchBar.delegate = self
        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear"),
            Candy(category:"Other", name:"Candy Floss"),
            Candy(category:"Chocolate", name:"Chocolate Coin"),
            Candy(category:"Chocolate", name:"Chocolate Egg"),
            Candy(category:"Other", name:"Jelly Beans"),
            Candy(category:"Other", name:"Liquorice"),
            Candy(category:"Hard", name:"Toffee Apple")
        ]
        //limpar()
        //criacaoDeUsuarios()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter({( candy : Candy) -> Bool in
            let doesCategoryMatch = (scope == "All") || (candy.category == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && candy.name.lowercased().contains(searchText.lowercased())
            }
        })
        table.reloadData()
    }
    func filtrarConteudoPorTexto(_ texto: String, escopo: String = "Todos") {
        var resultado = todosInteresses().filter({( interesse: Interesses) -> Bool in
            var aprender = false
            if escopo != "Todos" {
                aprender = escopo == "Aprender"
            }
            let tipoIgual = (escopo == "Todos") || (interesse.aprender == aprender)
            
            if searchBarIsEmpty() {
                return tipoIgual
            } else {
                return tipoIgual && (interesse.titulo?.lowercased().contains(texto.lowercased()))!
            }
        })
        table.reloadData()
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    // Do any additional setup after loading the view.
}


struct Candy{
    let category: String
    let name: String
}

extension FeedViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
        //filtrarConteudoPorTexto(searchController.searchBar.text!, escopo: scope)
    }
}

extension FeedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detalhe", sender: nil)
    }
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if(velocity.y>0) {
//            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
//            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
//                self.navigationController?.setNavigationBarHidden(true, animated: true)
//                print("Hide")
//            }, completion: nil)
//            UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions(), animations: {
////                for button in self.buttons{
////                    button.isHidden = true
////                }
//                self.stackView.isHidden = true
//            }, completion: nil)
//        } else {
//            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
//                self.navigationController?.setNavigationBarHidden(false, animated: true)
//                print("Unhide")
//            }, completion: nil)
//
//            UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions(), animations: {
//                self.stackView.isHidden = false
//            }, completion: nil)
//
////            UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions(), animations: {
//////                for button in self.buttons{
//////                    button.isHidden = false
//////                }
////                self.stackView.animate
////            }, completion: nil)
//        }
//    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCandies.count
        }
        return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else { fatalError() }
        let candy: Candy
        if isFiltering() {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        cell.nome.text = candy.name
        cell.categoria.text = candy.category
        
        return cell
    }
}

extension FeedViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
