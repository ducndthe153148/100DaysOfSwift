//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nguyễn Đình Trung Đức on 10/02/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var questionText: String
    var rightAnswer: String
    init(q: String, a: String){
        self.questionText = q
        self.rightAnswer = a
    }
}
