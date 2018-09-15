//
//  TypeCell.swift
//  Pokedex
//
//  Created by Vaibhav Gattani on 14/9/18.
//  Copyright © 2018 Vaibhav Gattani. All rights reserved.
//

import UIKit

class TypeCell: UICollectionViewCell {
    
    var typeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        typeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 20))
        typeImageView.contentMode = .scaleAspectFill
        typeImageView.clipsToBounds = true
        contentView.addSubview(typeImageView)
    }
    
    
}
