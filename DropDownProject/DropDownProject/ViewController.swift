//
//  ViewController.swift
//  DropDownProject
//
//  Created by Nguyễn Đình Trung Đức on 20/01/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var childView: UIView!
    
    let menu: DropDown = {
        let menu = DropDown()
        let images = ["bookmark", "house", "gear", "ear"]
        // Datasource for the drop down is an array
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
        myView.backgroundColor = .red
        
        guard let topView = navigationController?.navigationBar.topItem?.titleView else {
            return
        }
        
        // View mà dropdown sẽ display lên (có thể custom)
        menu.anchorView = childView
        
        // Same as tap action
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        // Add gesture to topView
        topView.addGestureRecognizer(gesture)
        
        // Add gesture to childView
        childView.addGestureRecognizer(gesture)
        
        menu.selectionAction = { [weak self] (index, title) in
            guard let self = self else { return }
            print("Index là: \(index), title là: \(title)")
        }
        menu.bottomOffset = CGPoint(x: 0, y: childView.frame.size.height)
        
    }

    @objc func didTapTopItem(){
        menu.show()
    }
}

extension ViewController {
    
}
