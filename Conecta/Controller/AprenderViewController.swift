//
//  AprenderViewController.swift
//  Conecta
//
//  Created by Pedro Henrique da Silva on 06/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class AprenderViewController: UIViewController {
    
    @IBOutlet weak var data: UIDatePicker!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    let loc = Locale(identifier: "pt-br")
    var blurReference = Blur()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if pegarUsuarioConectado() == nil {
            if blurReference.superview == nil {
                view.addSubview(blurReference)
                view.bringSubviewToFront(blurReference)
            }
        } else {
            blurReference.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.locale = loc
        blurReference = Blur(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        blurReference.onClick = presentLogin
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Salvar(_ sender: UIButton) {
        if let titulo = titulo.text, let descricao = descricao.text {
            let u = pegarUsuarioConectado()
            criarInteresse(titulo: titulo, aprender: true, descricao: descricao, horaCadastro: horaAtual(), idAutor: u!.id, nomeAutor: "\(u!.nome!) \(u!.sobrenome!)", avaliacao: 0.0, horarios: "")
        }
    }
    
    @IBAction func limpar(_ sender: UIButton) {
        titulo.text = ""
        descricao.text = "Java API..."
    }
    func presentLogin(){
        performSegue(withIdentifier: "entrar", sender: nil)
    }

}
