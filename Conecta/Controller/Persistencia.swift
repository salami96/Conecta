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
    //Início das functions para interesses
    func criarUsuario(email: String, senha: String, nome: String, sobrenome: String, telefone: String, avatar: String) -> (Bool, String){
        var erro = false
        var mensagem = ""
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            for usuario in todosUsuarios(){
                if usuario.email == email {
                    mensagem = "Esse email já está cadastrado no Conecta!"
                    erro = true
                }
            }
            if !erro {
                let usuario = Usuarios(context: context)
                usuario.email = email
                usuario.senha = senha
                usuario.telefone = telefone
                usuario.nome = nome
                usuario.sobrenome = sobrenome
                usuario.id = Int16(todosUsuarios().count)
                usuario.avatar = avatar
                do {
                    try context.save()
                } catch let error {
                    print("Ocorreu um erro \(error)")
                    mensagem = "Ocorreu um erro \(error)"
                    erro = true
                }
            }
        }
        return (erro, mensagem)
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
    func conectarUsuario(email: String, senha: String) -> Bool{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        var resultado = false
        if let context = appDelegate?.persistentContainer.viewContext{
            let usuarios = todosUsuarios()
            let conectado = pegarUsuarioConectado() ?? UsuarioConectado(context: context)
            for usuario in usuarios {
                if usuario.email == email && usuario.senha == senha {
                    conectado.email = usuario.email
                    conectado.id = usuario.id
                    conectado.nome = usuario.nome
                    conectado.senha = usuario.senha
                    conectado.sobrenome = usuario.sobrenome
                    conectado.telefone = usuario.telefone
                    conectado.avatar = usuario.avatar
                    resultado = true
                }
            }
            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
        return resultado
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
    func pegarAvatar(id: Int16) -> String {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        var resultado = ""
        if (appDelegate?.persistentContainer.viewContext) != nil{
            let usuarios = todosUsuarios()
            for usuario in usuarios {
                if usuario.id == id {
                    resultado = usuario.avatar ?? ""
                }
            }
        }
        return resultado
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
    func limparUsuarios(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            sair()
            for usuario in todosUsuarios(){
                context.delete(usuario)
            }
            for interesse in todosInteresses(){
                context.delete(interesse)
            }

            do {
                try context.save()
            } catch let error {
                print("Ocorreu um erro \(error)")
            }
        }
    }
    //Fim das functions para usuarios
    
    //Início das functions para interesses
    func criarInteresse(titulo: String, aprender: Bool, descricao: String, horaCadastro: String, idAutor: Int16, nomeAutor: String, avaliacao: Double, horarios: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            //var erro = false
            //if !erro {
                let interesse = Interesses(context: context)
                interesse.titulo = titulo
                interesse.aprender = aprender
                interesse.descricao = descricao
                interesse.horaCadastro = horaCadastro
                interesse.horarios = horarios
                interesse.idAutor = idAutor
                interesse.nomeAutor = nomeAutor
                interesse.avaliacao = avaliacao
                interesse.id = Int16(todosInteresses().count)
                do {
                    try context.save()
                } catch let error {
                    print("Ocorreu um erro \(error)")
                }
            //}
        }
    }
    func todosInteresses() -> [Interesses]{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request: NSFetchRequest  = Interesses.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: false)]
            do {
                return try context.fetch(request)
            } catch let error {
                print("Ocorreu um erro: \(error)")
            }
        }
        return []
    }
    func interessesDeAprender(aprender: Bool) -> [Interesses]{
        let interesses = todosInteresses()
        var resultado = [Interesses]()
        for interesse in interesses{
            if aprender == interesse.aprender {
                resultado.append(interesse)
            }
        }
        return resultado
    }
    func todosInteressesPorAutor(id: Int16) -> [Interesses]{
        let interesses = todosInteresses()
        var resultado = [Interesses]()
        for interesse in interesses{
            if id == interesse.idAutor {
                resultado.append(interesse)
            }
        }
        return resultado
    }
    func interessesPorAutorEAprender(id: Int16, aprender: Bool) -> [Interesses]{
        let interesses = todosInteresses()
        var resultado = [Interesses]()
        for interesse in interesses{
            if id == interesse.idAutor && aprender == interesse.aprender {
                resultado.append(interesse)
            }
        }
        return resultado
    }
    func horaAtual() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let horaCadastro = "\(month)/\(day)/\(year) \(hour):\(minutes):00 AM"
        return horaCadastro
    }
//    func filtrarConteudoPorTexto(_ texto: String, escopo: String = "Todos") {
//        var resultado = todosInteresses().filter({( interesse: Interesses) -> Bool in
//            var aprender: Bool
//            if escopo != "Todos" {
//                aprender = escopo == "Aprender"
//            }
//            let tipoIgual = (escopo == "Todos" || (interesse.aprender == aprender)
//        })
//        filteredCandies = candies.filter({( candy : Candy) -> Bool in
//            let doesCategoryMatch = (scope == "All") || (candy.category == scope)
//            
//            if searchBarIsEmpty() {
//                return doesCategoryMatch
//            } else {
//                return doesCategoryMatch && candy.name.lowercased().contains(searchText.lowercased())
//            }
//        })
//        table.reloadData()
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
