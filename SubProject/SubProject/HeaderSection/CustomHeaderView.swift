//
//  CustomHeaderView.swift
//  SubProject
//
//  Created by MacOS on 26/01/2022.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lblDown: UILabel!
    @IBOutlet weak var lblUp: UILabel!
    @IBOutlet weak var headerView: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
