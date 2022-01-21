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
        
        //no need to write following if checked in storyboard
        self.scrollView.bounces = false
        self.tableView.bounces = true
                
//        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.frame.size.height+(5*140));
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.frame.size.height = self.tableView.contentSize.height
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == self.scrollView {
//            tableView.isScrollEnabled = (self.scrollView.contentOffset.y >= 200)
//        }
//
//        if scrollView == self.tableView {
//            self.tableView.isScrollEnabled = (tableView.contentOffset.y > 0)
//        }
//    }
    
}
