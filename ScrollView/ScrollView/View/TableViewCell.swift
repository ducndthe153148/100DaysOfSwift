//
//  TableViewCell.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 12/01/2022.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewCell: UITableViewCell {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var dateFinish: UILabel!
    @IBOutlet weak var dateStart: UILabel!
    @IBOutlet weak var lblPlan: UILabel!
    @IBOutlet weak var superView: UIView!

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
