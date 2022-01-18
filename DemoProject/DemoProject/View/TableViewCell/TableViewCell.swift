//
//  TableViewCell.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    // Label of left view
    @IBOutlet weak var titleLeft: UILabel!
    @IBOutlet weak var startLeft: UILabel!
    @IBOutlet weak var endLeft: UILabel!
    
    // Label of right view
    @IBOutlet weak var numberRight: UILabel!
    @IBOutlet weak var typeRight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set corner UI
        superView.layer.cornerRadius = 12
        leftView.layer.cornerRadius = 12
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        rightView.layer.cornerRadius = 12
        rightView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
}
