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
    
    @IBOutlet weak var queroEnsinarButton: UIButton!
    @IBOutlet weak var queroAprenderButton: UIButton!
    
    
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
    func criacaoInteresses() {
        criarInteresse(titulo: "Java", aprender: false, descricao: "Programação orientada à objeto, encapsulamento, herança, polimorfismo", horaCadastro: "5/28/2019 2:23:15 PM", idAutor: 1, nomeAutor: "Clark Andrews", avaliacao: 0, horarios: "6/28/2019 8:30:15 AM")
        criarInteresse(titulo: "Química Orgânica", aprender: true, descricao: "Cadeias carbônicas, ressonância e anéis aromáticos", horaCadastro: "5/16/2019 10:23:15 PM", idAutor: 6, nomeAutor: "Jessica Oliveira", avaliacao: 0, horarios: "6/15/2019 11:00:15 AM")
        criarInteresse(titulo: "Aulas de violão", aprender: false, descricao: "Aulas para iniciantes", horaCadastro: "4/10/2019 7:35:15 PM", idAutor: 8, nomeAutor: "Sophia Barbosa", avaliacao: 0, horarios: "6/18/2019 9:30:00 AM")
        criarInteresse(titulo: "Aulas de Inglês", aprender: false, descricao: "Aulas do básico ao avançado: leitura, escrita e conversação", horaCadastro: "2/11/2019 4:15:34 PM", idAutor: 2, nomeAutor: "Olivia Jones", avaliacao: 0, horarios: "6/27/2019 10:00:00 AM")
        criarInteresse(titulo: "Kotlin", aprender: true, descricao: "Desenvolvimento mobile", horaCadastro: "3/13/2019 5:57:12 PM", idAutor: 1, nomeAutor: "Clark Andrews", avaliacao: 0, horarios: "6/18/2019 8:30:00 PM")
        criarInteresse(titulo: "Banco de dados", aprender: false, descricao: "Aulas sobre banco de dados com SQL", horaCadastro: "4/11/2019 1:12:13 PM", idAutor: 5, nomeAutor: "Matheus Soares", avaliacao: 0, horarios: "7/15/2019 9:00:00 AM")
        criarInteresse(titulo: "Swift", aprender: false, descricao: "Desenvolvimento mobile para IOS", horaCadastro: "8/19/2019 2:55:17 PM", idAutor: 3, nomeAutor: "John Stuart", avaliacao: 0, horarios: "8/2/2019 2:30:00 PM")
        criarInteresse(titulo: "Física", aprender: true, descricao: "Mecânica Quântica", horaCadastro: "10/6/2019 7:09:03 PM", idAutor: 7, nomeAutor: "Antonio Moraes", avaliacao: 0, horarios: "10/25/2019 11:30:00 AM")
        criarInteresse(titulo: "Aulas de Cálculo 2", aprender: false, descricao: "Derivada Parcial, Integral dupla e tripla", horaCadastro: "1/10/2019 3:15:14 PM", idAutor: 4, nomeAutor: "Mariana Almeida", avaliacao: 0, horarios: "2/14/2019 9:00:00 AM")
        criarInteresse(titulo: "Matemática Básica", aprender: false, descricao: "Matemática para ensino médio", horaCadastro: "9/12/2019 1:27:18 PM", idAutor: 7, nomeAutor: "Antonio Moraes", avaliacao: 0, horarios: "11/11/2019 2:00:00 PM")
        criarInteresse(titulo: "Aulas de Francês", aprender: true, descricao: "Francês básico para conversação", horaCadastro: "1/5/2019 11:34:56 PM", idAutor: 2, nomeAutor: "Olivia Jones", avaliacao: 0, horarios: "3/29/2019 9:00:00 AM")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the Search Controller
        queroEnsinarButton.layer.cornerRadius = 10
        queroAprenderButton.layer.cornerRadius = 10
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "O que quer aprender ou ensinar?"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = true
        table.dataSource = self
        table.delegate = self
        searchController.searchBar.scopeButtonTitles = ["Todos", "Ensinar", "Aprender"]
        searchController.searchBar.delegate = self
        limparUsuarios()
        criacaoDeUsuarios()
        criacaoInteresses()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filtrarConteudoPorTexto(_ texto: String, escopo: String = "Todos") {
        interessesFiltrados = todosInteresses().filter({( interesse: Interesses) -> Bool in
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


extension FeedViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        //filterContentForSearchText(searchController.searchBar.text!, scope: scope)
        filtrarConteudoPorTexto(searchController.searchBar.text!, escopo: scope)
    }
}

extension FeedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreenVC = segue.destination as? FeedDetailViewController, let data = sender as? Usuarios {
            nextScreenVC.usuario = data
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dados = Usuarios()
        for usuario in todosUsuarios(){
            if isFiltering() {
                if usuario.id == interessesFiltrados[indexPath.row].idAutor {
                    dados = usuario
                }
            } else {
                if usuario.id == todosInteresses()[indexPath.row].idAutor {
                    dados = usuario
                }
            }
        }
        performSegue(withIdentifier: "Detalhe", sender: dados)
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
            return interessesFiltrados.count
        }
        return todosInteresses().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else { fatalError() }
//        let candy: Candy
//        if isFiltering() {
//            candy = filteredCandies[indexPath.row]
//        } else {
//            candy = candies[indexPath.row]
//        }
//        cell.nome.text = candy.name
//        cell.categoria.text = candy.category
        var interesse: Interesses
        if isFiltering() {
            interesse = interessesFiltrados[indexPath.row]
        } else {
            interesse = todosInteresses()[indexPath.row]
        }
        
        
        cell.nome.text = interesse.nomeAutor
        if interesse.aprender {
            cell.categoria.text = "Quer aprender: " + interesse.titulo!
            cell.avaliacao.text = ""
            cell.star.isHidden = true
            cell.icon.image = UIImage(named: "Aluno")
            cell.linha.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        } else {
            cell.categoria.text = "Quer ensinar: " + interesse.titulo!
            cell.avaliacao.text = "\(interesse.avaliacao)"
            cell.star.isHidden = false
            cell.star.image = UIImage(named: interesse.avaliacao > 0 ? "EstrelaAmarela" : "Estrelacinza")
            cell.avaliacao.textColor = interesse.avaliacao > 0 ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            cell.icon.image = UIImage(named: "Professor")
            cell.linha.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1)
        }
        cell.img.image = UIImage(named: pegarAvatar(id: interesse.idAutor))
        cell.horarios.text = interesse.horaCadastro
        
        DispatchQueue.main.async {
            cell.backView.layer.cornerRadius = 10.0;
            cell.frontView.roundCorners([.topRight, .bottomRight], radius: 10)
        }
        
        cell.roundCorners([.topRight, .bottomRight], radius: 10)
        return cell
    }
}

extension FeedViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filtrarConteudoPorTexto(searchBar.text!, escopo: searchBar.scopeButtonTitles![selectedScope])
    }
}
