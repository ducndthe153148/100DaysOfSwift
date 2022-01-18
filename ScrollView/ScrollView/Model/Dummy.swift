//
//  Dummy.swift
//  ScrollView
//
//  Created by Nguyễn Đình Trung Đức on 12/01/2022.
//

import Foundation

struct Dummy: Decodable {
    let totalDay: Int
    let startDay: String
    let endDay: String
}

struct DummyABC: Decodable {
    let dummy: [Dummy]
}
