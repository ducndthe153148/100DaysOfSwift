//
//  TestViewModel.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 14/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

class TestViewModel {
    
    var disposeBag = DisposeBag()

    struct Input {
        let viewWillAppear: Observable<Void>
    }
    
    struct Output {
        let targets: Observable<[Dummy]>
    }
    
    func transform(input: Input) -> Output {
        let service = DummyService()
        let targets = service.fetchData().asObservable()
        let data = input.viewWillAppear.withLatestFrom(targets)
            .map { (target) -> [Dummy] in
                return target.dummy
            }
        return Output(targets: data)
    }
    
}
