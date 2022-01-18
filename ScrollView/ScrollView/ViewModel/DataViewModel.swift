//
//  DataViewModel.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 18/01/2022.
//

import RxSwift
import RxCocoa

class DataViewModel {
    
    var items = BehaviorSubject<[TableViewSection]>(value: [
        
        // Bind thẳng data vào tableviewsection
        TableViewSection(items: [
        
            TableViewItem(title: "One"),
            TableViewItem(title: "Two"),
            TableViewItem(title: "Three"),
            TableViewItem(title: "Four"),
            TableViewItem(title: "Five"),
            TableViewItem(title: "Six")
            
        ], header: "First section"),
        
        TableViewSection(items: [
        
            TableViewItem(title: "Seven"),
            TableViewItem(title: "Eight"),
            TableViewItem(title: "Nine"),
            TableViewItem(title: "Ten"),
            TableViewItem(title: "Evelen"),
            TableViewItem(title: "Twelve")
            
        ], header: "Second section")
        
    ])
    
    let dataSource = DummyDataSource.dataSource()
    let targetsTest: PublishRelay<[TableViewSection]> = .init()
    var disposeBag = DisposeBag()
    var viewWillAppear: PublishRelay<Void> = .init()
    var dataDummy: PublishRelay<[Dummy]> = .init()
    
    init(){
        self.viewWillAppear.subscribe({ [weak self] event in
            guard let self = self else { return }
            switch event {
            case .next:
                print("Vao day")
                self.ViewModel()
            default:
                return
            }
        }).disposed(by: disposeBag)
    }
    
    func ViewModel(){
        let service = DummyService()
        service.fetchData().subscribe(onNext: { [weak self] dummys in
            guard let self = self else { return }
            
            self.dataDummy.accept(dummys.dummy)

        }).disposed(by: disposeBag)
    }
}
