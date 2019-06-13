//
//  ListaAprenderViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 13/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class ListaAprenderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var interesses = [Interesses]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let interesse = interesses[indexPath.row]
        cell.textLabel?.text = "Quero aprender: " + interesse.titulo!
        cell.detailTextLabel?.text = interesse.horaCadastro
        
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            removerInteresse(interesse: interesses[indexPath.row])
            interesses = interessesPorAutorEAprender(id: pegarUsuarioConectado()!.id, aprender: true)
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var table: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        interesses = interessesPorAutorEAprender(id: pegarUsuarioConectado()!.id, aprender: true)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
