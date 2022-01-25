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
//        self.tableView.frame.size.height = self.tableView.contentSize.height
        
//        tableView.estimatedRowHeight = 68.0
//        tableView.rowHeight = UITableView.automaticDimension
        
        //no need to write following if checked in storyboard
        self.scrollView.bounces = false
        self.tableView.bounces = true
                
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableHeightConstraint.constant = tableView.contentSize.height
//        super.viewDidAppear(animated)
//    }
    
    // MARK: - View
    override func updateViewConstraints() {
        tableHeightConstraint.constant = tableView.contentSize.height
        self.tableView.layoutIfNeeded()
        super.updateViewConstraints()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.txtInfor.text = "開始日時：2021年12月28日12:33:52 開始日時：2021年12月28日12:33:52 開始日時：2021年12月28日12:33:52"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
