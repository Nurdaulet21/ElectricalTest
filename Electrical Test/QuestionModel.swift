//
//  QuestionModel.swift
//  Electrical Test
//
//  Created by Нурдаулет on 26.05.2024.
//

import Foundation

struct Question: Codable {
    let question: String
    let options: [String]
    let correctAnswer: Int
}
