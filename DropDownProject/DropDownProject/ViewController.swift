//
//  ViewController.swift
//  DropDownProject
//
//  Created by Nguyễn Đình Trung Đức on 20/01/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController {

    let menu: DropDown = {
        let menu = DropDown()
        let images = ["bookmark", "house", "gear", "ear"]
        menu.dataSource = ["Item1", "Item2", "Item3", "Item4"]
        
        menu.cellNib = UINib (nibName: "DropDownCell", bundle: nil)
        // title chính là datasource
        menu.customCellConfiguration = { index, title, cell in
            guard let cell = cell as? MyDropCell else {
                return
            }
            print("Thiss is title \(title)")
            cell.myImageView.image = UIImage(systemName: images[index])
        }
        return menu
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tap on navigation to open my view
        let myView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        navigationController?.navigationBar.topItem?.titleView = myView
        
        guard let topView = navigationController?.navigationBar.topItem?.titleView else {
            return
        }
        
        // View mà dropdown sẽ display lên (có thể custom)
        menu.anchorView = topView
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        topView.addGestureRecognizer(gesture)
        
        menu.selectionAction = {index, title in
            print("Index là: \(index), title là: \(title)")
        }
    }

    @objc func didTapTopItem(){
        menu.show()
    }
}

