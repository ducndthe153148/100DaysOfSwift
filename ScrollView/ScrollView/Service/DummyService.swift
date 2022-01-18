//
//  DummyService.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 12/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

class DummyService {
    
    func fetchData() -> Observable<DummyABC> {
        
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "DummyHihi", ofType: "json") else {
                print("Di vao day")
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {}
            }
            do {
                print("Nhay vao day")
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let dummys = try JSONDecoder().decode(DummyABC.self, from: data)
                observer.onNext(dummys)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {}
        }
        
    }
    
    func fetchDataABC() -> Observable<[Dummy]> {
        print("come on babe hu hu")
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "DummyHihi", ofType: "json") else {
                print("Di vao day")
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {}
            }
            do {
                print("Nhay vao day")
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let dummys = try JSONDecoder().decode([Dummy].self, from: data)
                
                observer.onNext(dummys)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {}
        }
        
    }
    
}
