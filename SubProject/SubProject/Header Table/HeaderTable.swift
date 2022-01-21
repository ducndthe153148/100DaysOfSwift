//
//  HeaderTable.swift
//  SubProject
//
//  Created by Nguyễn Đình Trung Đức on 21/01/2022.
//

import UIKit

class HeaderTable: UIView {

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.main.loadNibNamed("HeaderTable", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }

}
