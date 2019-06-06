//
//  Persistencia.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 31/05/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit
import CoreData
import FirebaseFirestore

extension UIViewController {
    

    func criarInteresse(titulo: String){
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("Interesses").addDocument(data: [
            "titulo" : titulo
        ]) { err in
            if let err = err {
                print("Erro ao adicionar documento \(err)")
            } else {
                print("Documento adicionado com sucesso. ID: \(ref!.documentID)")
            }
        }
    }
//    func entrar(){
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        if let context = appDelegate?.persistentContainer.viewContext{
//            let task = Task(context: context)
//            task.name = taskName
//            do {
//                try context.save()
//            } catch let error {
//                print("Ocorreu um erro \(error)")
//            }
//        }
//    }
}
