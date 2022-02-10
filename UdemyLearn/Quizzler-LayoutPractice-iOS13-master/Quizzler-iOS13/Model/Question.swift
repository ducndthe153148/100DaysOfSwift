//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nguyễn Đình Trung Đức on 10/02/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
    
}
