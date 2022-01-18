//
//  DummyDataSource.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 18/01/2022.
//

import Foundation
import RxDataSources

struct TableViewItem {
    let title: String
    init(title: String) {
        self.title = title
    }
}

struct TableViewSection {
    let items: [TableViewItem]
    let header: String
    
    init(items: [TableViewItem], header: String) {
        self.items = items
        self.header = header
    }
}

extension TableViewSection: SectionModelType {
    
    typealias Item = TableViewItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct DummyDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource <TableViewSection> {
        return .init(configureCell: { (dataSource, tableView, indexPath, item) in
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            cell.dateStart.text = item.title
            return cell
        }, titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].header
        })
    }
}
