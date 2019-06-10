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
    var usuario = UsuarioConectado()
    
    
    override func viewWillAppear(_ animated: Bool) {
        if pegarUsuarioConectado() == nil {
            navigation.rightBarButtonItem?.isEnabled = false
            blur.isHidden = false
            blur.isUserInteractionEnabled = true
            
            
            
            //performSegue(withIdentifier: "entrar", sender: nil)
        } else {
            navigation.rightBarButtonItem?.isEnabled = true
            blur.isHidden = true
            usuario = pegarUsuarioConectado()!
            blur.isUserInteractionEnabled = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for u in todosUsuarios(){
            print(u.email)
        }
        //imagemPerfil.image = UIImage(named: usuario.avatar ?? "Guanabara")
        imagemPerfil.layer.cornerRadius = 50;
        imagemPerfil.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        imagemPerfil.layer.borderWidth = 1;
        

        
        //performSegue(withIdentifier: "entrar", sender: nil)
        
        // Do any additional setup after loading the view.
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
