//
//  RegistroViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 07/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet var fields: [UITextField]!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var sobrenome: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func salvar(_ sender: UIButton) {
        if isNotNull(fields: fields) && senha.text! == confirmarSenha.text!{
            let resultado = criarUsuario(email: email.text!, senha: senha.text!, nome: nome.text!, sobrenome: sobrenome.text!, telefone: telefone.text!, avatar: "avatar08")
            if resultado.0 {
                toShow(title: "Bem vindo ao Conecta! 😊", message: "Agora você pode entrar no sistema")
                dismiss(animated: true, completion: nil)
            } else {
                toShow(title: "Deu ruim! 😕", message: resultado.1)
            }
        }
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
