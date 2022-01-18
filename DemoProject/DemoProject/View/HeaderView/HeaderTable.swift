//
//  HeaderTable.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import UIKit

class HeaderTable: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var button: UIButton!
    
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
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.layer.cornerRadius = 24
    }
    
}
