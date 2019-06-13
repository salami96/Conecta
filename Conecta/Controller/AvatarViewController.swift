//
//  AvatarViewController.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 11/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var cancelarButton: UIButton!
    
    let imagens = ["avatar01", "avatar02", "avatar03", "avatar04", "avatar05", "avatar06", "avatar07", "avatar08", "avatar10"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = table.dequeueReusableCell(withReuseIdentifier: "avatar", for: indexPath) as? AvatarCollectionViewCell else { fatalError() }
        cell.imageView.image = UIImage(named: imagens[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        RegistroViewController.avatar = imagens[indexPath.row]
        dismiss(animated: true, completion: nil)
    }

    
    @IBOutlet weak var table: UICollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        cancelarButton.layer.cornerRadius = 10
    }
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
