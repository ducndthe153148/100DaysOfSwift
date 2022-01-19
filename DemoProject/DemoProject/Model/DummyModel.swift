//
//  DummyModel.swift
//  DemoProject
//
//  Created by Nguyễn Đình Trung Đức on 19/01/2022.
//

import Foundation
import Differentiator

enum SectionItem {
    case StatusOne
    case StatusTwo
    case StatusThree
}

enum SectionModel {
    case SectionOne(items: [SectionItem])
    case SectionTwo(items: [SectionItem])
    case SectionThree(items: [SectionItem])
}

extension SectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
          switch self {
          case .SectionOne(items: let items):
              return items.map { $0 }
          case .SectionTwo(items: let items):
              return items.map { $0 }
          case.SectionThree(items: let items):
              return items.map { $0 }
          }
      }

      init(original: SectionModel, items: [Item]) {
          switch  original {
          case .SectionOne(items: _):
              self = .SectionOne(items: items)
          case .SectionTwo(items: _):
              self = .SectionTwo(items: items)
          case .SectionThree(items: _):
              self = .SectionThree(items: items)
          }
      }
}
