//
//  CollectionViewCell.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelTest: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("an nhang nhang")
    }
    
    static let identifier = "CollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
