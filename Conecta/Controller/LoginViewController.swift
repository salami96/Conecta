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
import GoogleSignIn

class LoginViewController: UIViewController, FUIAuthDelegate, GIDSignInUIDelegate {

    

    @IBOutlet weak var googleSignIn: GIDSignInButton!
    
    @IBOutlet weak var email: UIButton!
    // Criando referencia a autenticacao
    lazy var usuario = Auth.auth()

    @IBOutlet weak var google: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIEmailAuth(),
        ]
        authUI?.providers = providers
        
        let authViewController = authUI?.authViewController()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let style = GIDSignInButtonStyle.wide
        google.style = style
        
        
        // Do any additional setup after loading the view.
//        usuario.createUser(withEmail: "joao@gmail.com", password: "joao1234") { (usuario, erro) in
//            guard let user = usuario?.user else { return }
//
//        }
    }
    @IBAction func entrar(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()

    }
    //    func application(_ app: UIApplication, open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
//        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
//            return true
//        }
//        // other URL handling goes here.
//        return false
//    }
    
}

