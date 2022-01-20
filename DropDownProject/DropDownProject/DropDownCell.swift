//
//  MyDropCell.swift
//  DropDownProject
//
//  Created by Nguyễn Đình Trung Đức on 20/01/2022.
//

import UIKit
import DropDown

class MyDropCell: DropDownCell {

    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
