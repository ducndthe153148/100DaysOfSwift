//
//  TableViewCell.swift
//  SubProject
//
//  Created by Nguyễn Đình Trung Đức on 21/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtInfor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
