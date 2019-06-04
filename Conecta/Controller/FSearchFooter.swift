//
//  FSearchFooter.swift
//  Conecta
//
//  Created by Pedro Henrique da Silva on 04/06/19.
//  Copyright © 2019 Gabriel Zanatto Salami. All rights reserved.
//
import UIKit
import Foundation

class SearchFooter: UIView {
    
   let label: UILabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        backgroundColor = UIColor.userGreen
        alpha = 0.0
        
        // Configure label
        label.textAlignment = .center
        label.textColor = UIColor.white
        addSubview(label)
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = bounds
    }
    
    //MARK: - Animation
    
    fileprivate func hideFooter() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 0.0
        }
    }
    
    fileprivate func showFooter() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 1.0
        }
    }
}
