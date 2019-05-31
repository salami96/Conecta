//
//  ViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 31/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController {


    // Criando referencia a autenticacao
    lazy var usuario = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usuario.createUser(withEmail: "joao@gmail.com", password: "joao1234") { (usuario, erro) in
            guard let user = usuario?.user else { return }
            
        }
    }
    
}

