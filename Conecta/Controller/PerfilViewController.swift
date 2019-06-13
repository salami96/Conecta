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

    
    
    @IBOutlet weak var topBannerView: UIView!
    @IBOutlet weak var contatoView: UIView!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var imagemPerfil: UIImageView!
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBOutlet weak var capa: UIImageView!
    @IBOutlet weak var editBioButton: UIButton!
    @IBOutlet weak var editContatoButton: UIButton!
    
    var usuario = UsuarioConectado()
    var blurReference = Blur()
    
    override func viewWillAppear(_ animated: Bool) {
       
        recarregaUsuario()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for u in todosUsuarios(){
            print(u.nome! + u.avatar! + u.email! + "\(u.id)")
        }
        topBannerView.layer.cornerRadius = 5
        topBannerView.layer.shadowColor = UIColor.gray.cgColor
        topBannerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        topBannerView.layer.shadowRadius = 12.0
        topBannerView.layer.shadowOpacity = 0.1
        
        imagemPerfil.layer.cornerRadius = 50
        imagemPerfil.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imagemPerfil.layer.borderWidth = 1
        
        bioView.layer.cornerRadius = 5
        bioView.layer.shadowColor = UIColor.gray.cgColor
        bioView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bioView.layer.shadowRadius = 12.0
        bioView.layer.shadowOpacity = 0.1
        
        contatoView.layer.cornerRadius = 5
        contatoView.layer.shadowColor = UIColor.gray.cgColor
        contatoView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contatoView.layer.shadowRadius = 12.0
        contatoView.layer.shadowOpacity = 0.1
        
        ratingView.layer.cornerRadius = 5
        ratingView.layer.shadowColor = UIColor.gray.cgColor
        ratingView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        ratingView.layer.shadowRadius = 12.0
        ratingView.layer.shadowOpacity = 0.1
        
        editBioButton.layer.cornerRadius = 5
        editContatoButton.layer.cornerRadius = 5
        
        blurReference = Blur(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        blurReference.onClick = presentLogin
    }

    public func recarregaUsuario(){

        if pegarUsuarioConectado() == nil {
            navigation.rightBarButtonItem?.isEnabled = false
            if blurReference.superview == nil {
                view.addSubview(blurReference)
                view.bringSubviewToFront(blurReference)
            }
        } else {
            blurReference.removeFromSuperview()
            navigation.rightBarButtonItem?.isEnabled = true
            usuario = pegarUsuarioConectado()!
            imagemPerfil.image = UIImage(named: usuario.avatar ?? "account-outline")
            email.text = usuario.email
            telefone.text = usuario.telefone
            nome.text = usuario.nome! + " " + usuario.sobrenome!
            var resto = usuario.id % 2 == 0
            capa.image = UIImage(named: resto ? "papel10" : "papel40")
            capa.layer.cornerRadius = 5
            //blur.isHidden = true
//            blur.isUserInteractionEnabled = true
        }
    }

    
    @IBAction func sair(_ sender: UIBarButtonItem) {
        sair()
        recarregaUsuario()
    }
    @IBAction func entrar(_ sender: UIButton) {
        performSegue(withIdentifier: "entrar", sender: nil)
    }
    func presentLogin(){
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
