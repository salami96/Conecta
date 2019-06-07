//
//  FeedDetailViewController.swift
//  Conecta
//
//  Created by Bruno Adam Alves on 07/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var perfilView: UIView!
    @IBOutlet weak var interessesView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImage.layer.cornerRadius = 5
        perfilImage.layer.cornerRadius = 50;
        perfilImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        perfilImage.layer.borderWidth = 1;
        interessesView.layer.cornerRadius = 5
        perfilView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
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
