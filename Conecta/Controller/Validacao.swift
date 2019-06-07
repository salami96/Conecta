//
//  Validacao.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 07/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

extension UIViewController {
    func isNotNull(fields: [UITextField]) -> Bool{
        var valid = true
        for field in fields{
            if field.text?.isEmpty ?? true {
                field.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                field.layer.borderWidth = 1
                valid = false
            } else if field.textContentType == UITextContentType.emailAddress && !verifyEmail(email: field.text!) {
                field.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                field.layer.borderWidth = 1
                toShow(title: "Erro", message: "E-mail inválido")
            } else {
                field.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                field.layer.borderWidth = 0
            }
        }
        if !valid {
            toShow(title: "Erro", message: "Os campos destacados são obrigatórios")
        }
        return valid
    }
    func isChecked(field: UISwitch) -> Bool {
        if !field.isOn {
            field.tintColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            toShow(title: "Erro", message: "É obrigatório aceitar os termos e condições!")
            return false
        }
        field.tintColor = #colorLiteral(red: 0.9327718616, green: 0.9489209056, blue: 0.9613297582, alpha: 1)
        return true
    }
    func verifyEmail(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    public func toShow(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    

}
