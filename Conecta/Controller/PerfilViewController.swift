//
//  PerfilViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 05/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import QuartzCore

class PerfilViewController: UIViewController {

    @IBOutlet weak var imagemPerfil: UIImageView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBOutlet weak var capa: UIImageView!
    
    var usuario = UsuarioConectado()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        recarregaUsuario()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for u in todosUsuarios(){
            print(u.nome! + u.avatar! + u.email! + "\(u.id)")
        }
        imagemPerfil.layer.cornerRadius = 50;
        imagemPerfil.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        imagemPerfil.layer.borderWidth = 1;
    }

    public func recarregaUsuario(){
        if pegarUsuarioConectado() == nil {
            navigation.rightBarButtonItem?.isEnabled = false
//            blur.isHidden = false
//            blur.isUserInteractionEnabled = true
        } else {
            navigation.rightBarButtonItem?.isEnabled = true
//            blur.isHidden = true
            usuario = pegarUsuarioConectado()!
//            blur.isUserInteractionEnabled = true
            imagemPerfil.image = UIImage(named: usuario.avatar ?? "account-outline")
            email.text = usuario.email
            telefone.text = usuario.telefone
            nome.text = usuario.nome! + " " + usuario.sobrenome!
            var resto = usuario.id % 2 == 0
            capa.image = UIImage(named: resto ? "papel10" : "papel40")
        }
    }

    
    @IBAction func sair(_ sender: UIBarButtonItem) {
        sair()
        performSegue(withIdentifier: "entrar", sender: nil)
    }
    @IBAction func entrar(_ sender: UIButton) {
        performSegue(withIdentifier: "entrar", sender: nil)
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
