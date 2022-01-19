//
//  CustomHeader.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 19/01/2022.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        print("Ga la ga dang gay 123 ")

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("Ga la ga dang gay 456")
    }
    
}
