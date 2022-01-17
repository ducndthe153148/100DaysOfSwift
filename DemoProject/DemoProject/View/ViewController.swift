//
//  ViewController.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register tableview cell
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        // Register collectionview cell
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }

//    private func loadHeaderTable () {
//        let cView = HeaderTable()
//        self.headerView.addSubview(cView)
//        cView.frame = self.headerView.bounds
//    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = "ABC"
        return cell
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.labelTest.text = "XYZ"
        print("trung duc ne")
        
        return cell
    }
    
     
}
