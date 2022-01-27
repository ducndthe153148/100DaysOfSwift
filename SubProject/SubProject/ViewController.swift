//
//  ViewController.swift
//  SubProject
//
//  Created by Nguyễn Đình Trung Đức on 21/01/2022.
//

import UIKit
import DropDown

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
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        // Register header
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
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
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.txtInfor.text = "30日間 10回 乗車チケット"
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
    
    //Custom Header of Section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
        if section == 0 {
            headerView.lblUp.text = "定額乗り放題（自動更新"
            headerView.lblDown.text = "一定期間、mobiを何度でも乗れるプラン"
        } else if section == 1 {
            headerView.lblUp.text = "チケット（自動更新"
            headerView.lblDown.text = #"ご指定の回数分mobiに乗車できるプラン\#n余った回数は次回更新に持ち越されます"#
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.estimatedRowHeight = 150
        return UITableView.automaticDimension
    }
}
