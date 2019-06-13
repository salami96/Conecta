//
//  RegistroViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 07/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {
    func trocaImg(value: String) {
        imageView.image = UIImage(named: value)
        avatarNome = value
    }
    static var avatar: String = ""
    var avatarNome: String = ""

    @IBOutlet var fields: [UITextField]!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var sobrenome: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if RegistroViewController.avatar != "" {
            trocaImg(value: RegistroViewController.avatar)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarNome = "avatar08"
        
        cancelarButton.layer.cornerRadius = 10
        salvarButton.layer.cornerRadius = 10
    }
    
    @IBAction func trocaAvatar(_ sender: UIButton) {
        performSegue(withIdentifier: "trocaAvatar", sender: nil)
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func salvar(_ sender: UIButton) {
        if isNotNull(fields: fields) && senha.text! == confirmarSenha.text!{
            let resultado = criarUsuario(email: email.text!, senha: senha.text!, nome: nome.text!, sobrenome: sobrenome.text!, telefone: telefone.text!, avatar: avatarNome)
            if !resultado.0 {
                toShow(title: "Bem vindo ao Conecta! 😊", message: "Agora você pode entrar no sistema")
                dismiss(animated: true, completion: nil)
            } else {
                toShow(title: "Deu ruim! 😕", message: resultado.1)
            }
        }
    }
}
