//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Laborit on 5/06/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

//my first Struct

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
