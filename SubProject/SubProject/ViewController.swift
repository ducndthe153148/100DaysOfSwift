//
//  ViewController.swift
//  SubProject
//
//  Created by Nguyễn Đình Trung Đức on 21/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerTable: HeaderTable!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.backgroundColor = .red
        headerTable.contentView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        
        // Disable scroll of table view
        self.tableView.isScrollEnabled = false
        
//        tableView.estimatedRowHeight = 120
//        tableView.rowHeight = UITableView.automaticDimension
        
        //no need to write following if checked in storyboard
//        self.scrollView.bounces = false
//        self.tableView.bounces = true
                
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    // MARK: - NEW - Cái này hoạt động ạ, mà nó dài hẳn lên
//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
//        self.tableView.reloadData()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        self.tableView.removeObserver(self, forKeyPath: "contentSize")
//    }
//
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "contentSize" {
//            if let newValue = change?[.newKey] {
//                let newSize = newValue as! CGSize
//                self.tableHeightConstraint.constant = newSize.height
//            }
//            print("running here")
//        }
//    }
    
    // MARK: - Cái này đíu hoạt động
//    override func updateViewConstraints() {
//        self.tableHeightConstraint.constant = CGFloat(self.tableView.contentSize.height)
//        self.tableView.layoutIfNeeded()
//        self.view.layoutIfNeeded()
//        self.scrollView.layoutIfNeeded()
//        super.updateViewConstraints()
//    }
    
    //gets called anytime your view controller's view has its bounds changed.
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        DispatchQueue.main.async {
            self.tableHeightConstraint.constant = self.tableView.contentSize.height
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.txtInfor.text = "Trung Duc dep trai qua di nuihfsdinầ  jadfnfaonfspdfui h hduanòu \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //self.viewWillLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
