//
//  TargetSection.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 17/01/2022.
//

import Foundation
import Differentiator

struct TargetSection {
    var header: String
    var items: [Dummy]
}

extension TargetSection: SectionModelType {
    typealias Item = Dummy
    init(original: TargetSection, items: [Item]) {
        self = original
        self.items = items
    }
}
