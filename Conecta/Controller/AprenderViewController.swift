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
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        data.locale = loc
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