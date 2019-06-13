//
//  FeedTableViewCell.swift
//  Conecta
//
//  Created by Gabriel Zanatto Salami on 05/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var avaliacao: UILabel!
    @IBOutlet weak var categoria: UILabel!
    @IBOutlet weak var horarios: UILabel!
    @IBOutlet weak var linha: UIView!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
