//
//  ListaViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 13/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var interesses = [Interesses]()
    var data: (Usuarios, Bool)?
    var aprender = true
    var usuario = Usuarios()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let interesse = interesses[indexPath.row]
        cell.textLabel?.text = (aprender ? "Quero aprender: " : "Quero ensinar: ") + interesse.titulo!
        cell.detailTextLabel?.text = interesse.horaCadastro
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            removerInteresse(interesse: interesses[indexPath.row])
            interesses = interessesPorAutorEAprender(id: usuario.id, aprender: aprender)
            tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var table: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        usuario = data!.0
        aprender = data!.1
        interesses = interessesPorAutorEAprender(id: usuario.id, aprender: aprender)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

}
