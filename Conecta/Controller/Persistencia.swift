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
    func criarUsuario(email: String, senha: String, nome: String, sobrenome: String, telefone: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let usuario = Usuarios(context: context)
            usuario.email = email
            usuario.senha = senha
            usuario.telefone = telefone
            usuario.nome = nome
            usuario.sobrenome = sobrenome
            usuario.id = Int16(todosUsuarios().count)
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    func todosUsuarios() -> [Usuarios]{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request: NSFetchRequest  = Usuarios.fetchRequest()
            do {
                return try context.fetch(request)
            } catch let error {
                print("Ocorreu um erro: \(error)")
            }
        }
        return []
    }
    func conectarUsuario(email: String, senha: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let usuarios = todosUsuarios()
            var conectado = pegarUsuarioConectado() ?? UsuarioConectado(context: context)
            for usuario in usuarios {
                if usuario.email == email && usuario.senha == senha {
                    conectado.email = usuario.email
                    conectado.id = usuario.id
                    conectado.nome = usuario.nome
                    conectado.senha = usuario.senha
                    conectado.sobrenome = usuario.sobrenome
                    conectado.telefone = usuario.telefone
                }
            }
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    func pegarUsuarioConectado() -> UsuarioConectado?{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request: NSFetchRequest  = UsuarioConectado.fetchRequest()
            do {
                return try context.fetch(request).first
            } catch let error {
                print("Ocorreu um erro: \(error)")
            }
        }
        return nil
    }
    func sair(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let usuario = pegarUsuarioConectado() ?? UsuarioConectado(context: context)
            context.delete(usuario)
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }

    

//    func criarInteresse(titulo: String){
//        let db = Firestore.firestore()
//        var ref: DocumentReference? = nil
//        ref = db.collection("Interesses").addDocument(data: [
//            "titulo" : titulo
//        ]) { err in
//            if let err = err {
//                print("Erro ao adicionar documento \(err)")
//            } else {
//                print("Documento adicionado com sucesso. ID: \(ref!.documentID)")
//            }
//        }
//    }
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
