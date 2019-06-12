//
//  EnsinarViewController.swift
//  Conecta
//
//  Created by Pedro Henrique da Silva on 06/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class EnsinarViewController: UIViewController {

    @IBOutlet weak var data: UIDatePicker!
    
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    let loc = Locale(identifier: "pt-br")
    override func viewDidLoad() {
        super.viewDidLoad()
        data.locale = loc
        cancelarButton.layer.cornerRadius = 10
        salvarButton.layer.cornerRadius = 10
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
