//
//  DummyViewModel.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 12/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

class DummyViewModel {
    var dummyService = DummyService()
    var models = [Dummy]()
    var disposeBag = DisposeBag()
    
    var viewWillAppear: PublishRelay<Void> = .init()
    var listDummy: PublishRelay<[Dummy]> = .init()
            
    init(){
        self.viewWillAppear.subscribe({ [weak self] event in
            guard let self = self else { return }
            switch event {
            case .next:
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
            // var test = dummys.dummy[0]
            //self.models.append(contentsOf: dummys.dummy)
            self.listDummy.accept(dummys.dummy)
//            print(dummys)
        }).disposed(by: disposeBag)
    }
}
