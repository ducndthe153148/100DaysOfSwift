//
//  ViewController.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 11/01/2022.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewWillAppear: PublishRelay<Void> = .init()
    let disposeBag = DisposeBag()
    lazy var viewModel = DummyViewModel()
    lazy var testViewModel = TestViewModel()
    
    private let dataViewModel = DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "過去にご加入いただいたプラン"
//        self.viewWillAppear.bind(to: self.viewModel.viewWillAppear).disposed(by: disposeBag)
        
        // Nhay vao day
//        self.bindViewModel()
        self.bindTableView()
        
        // Bind bằng cách cũ đẩy thẳng data qua
//        self.viewModel.listDummy.bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)){ (row, model, cell) in
//            cell.lblPlan.text = "\(model.totalDay)"
//            cell.dateStart.text = "\(model.startDay)"
//            cell.dateFinish.text = "\(model.endDay)"
//        }.disposed(by: disposeBag)
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        headerView.frame.size.height = 20
        // Setup the back button in navigation controller
    
        // Set delegate
        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.headerView.frame.size = CGSize(width: tableView.frame.width, height: tableView.frame.width)
        print("Accept 1 view View Will appear")
        viewWillAppear.accept(())
    }
    
    private func bindViewModel() {
        let inputs = TestViewModel.Input(viewWillAppear: viewWillAppear.asObservable())
        let outputs = testViewModel.transform(input: inputs)
        
        outputs.targets
            .bind(to: tableView.rx
                    .items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)){ (row, model, cell) in
                print("come on babe")
                cell.lblPlan.text = "\(model.totalDay)"
                cell.dateStart.text = "\(model.startDay)"
                cell.dateFinish.text = "\(model.endDay)"
            }.disposed(by: disposeBag)
    }
    
}

extension ViewController {
    private func bindTableView () {
        dataViewModel.items
            .bind(to: tableView.rx.items(dataSource: dataViewModel.dataSource))
            .disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}





