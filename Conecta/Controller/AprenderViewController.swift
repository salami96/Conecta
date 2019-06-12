//
//  AprenderViewController.swift
//  Conecta
//
//  Created by Pedro Henrique da Silva on 06/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class AprenderViewController: UIViewController {
    
    let loc = Locale(identifier: "pt-br")
    @IBOutlet weak var data: UIDatePicker!
   
    @IBOutlet weak var cancelarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.locale = loc
        cancelarButton.layer.cornerRadius = 10
        salvarButton.layer.cornerRadius = 10
    }

}
