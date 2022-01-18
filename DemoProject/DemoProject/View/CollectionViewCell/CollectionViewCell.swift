//
//  CollectionViewCell.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var buttonTouch: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonTouch.layer.cornerRadius = 24
        superView.layer.cornerRadius = 24
        print("an nhang nhang")
    }
    
    static let identifier = "CollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
