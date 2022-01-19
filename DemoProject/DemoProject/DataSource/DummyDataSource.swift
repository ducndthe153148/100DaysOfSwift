//
//  DummyDataSource.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 19/01/2022.
//

import Foundation
import RxDataSources
import RxSwift

struct DummyDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource <SectionModel> {
        
        return .init(configureCell: { (dataSource, tableView, indexPath, item) in
            switch dataSource[indexPath] {
            case .StatusOne:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ABc", for: indexPath)
                // do stuff
                return cell
            case .StatusTwo:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ABC", for: indexPath)
                // do stuff
                return cell
            case .StatusThree:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ABC", for: indexPath)
                // do stuff
                return cell
            }
        })
        
    }
    
}
