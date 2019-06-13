//
//  FeedDetailViewController.swift
//  Conecta
//
//  Created by Bruno Adam Alves on 07/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {

    var usuario = Usuarios()
    @IBOutlet weak var topBannerView: UIView!
    @IBOutlet weak var contatoView: UIView!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var imagemPerfil: UIImageView!
//    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBOutlet weak var capa: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBannerView.layer.cornerRadius = 5
        topBannerView.layer.shadowColor = UIColor.gray.cgColor
        topBannerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        topBannerView.layer.shadowRadius = 12.0
        topBannerView.layer.shadowOpacity = 0.1
        
        imagemPerfil.layer.cornerRadius = 50
        imagemPerfil.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        
//        editBioButton.layer.cornerRadius = 5
//        editContatoButton.layer.cornerRadius = 5
        
//        blurReference = Blur(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
//        blurReference.onClick = presentLogin
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
