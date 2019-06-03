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
import FirebaseUI

class LoginViewController: UIViewController, FUIAuthDelegate {


    // Criando referencia a autenticacao
    lazy var usuario = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIEmailAuth(),
        ]
        authUI?.providers = providers
        // Do any additional setup after loading the view.
        usuario.createUser(withEmail: "joao@gmail.com", password: "joao1234") { (usuario, erro) in
            guard let user = usuario?.user else { return }
            
        }
    }
    
}

