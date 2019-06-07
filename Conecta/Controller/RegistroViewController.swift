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
            criarUsuario(email: email.text!, senha: senha.text!, nome: nome.text!, sobrenome: sobrenome.text!, telefone: telefone.text!)
            toShow(title: "Bem vindo ao Conecta! 😊", message: "Agora você pode entrar no sistema")
            dismiss(animated: true, completion: nil)
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