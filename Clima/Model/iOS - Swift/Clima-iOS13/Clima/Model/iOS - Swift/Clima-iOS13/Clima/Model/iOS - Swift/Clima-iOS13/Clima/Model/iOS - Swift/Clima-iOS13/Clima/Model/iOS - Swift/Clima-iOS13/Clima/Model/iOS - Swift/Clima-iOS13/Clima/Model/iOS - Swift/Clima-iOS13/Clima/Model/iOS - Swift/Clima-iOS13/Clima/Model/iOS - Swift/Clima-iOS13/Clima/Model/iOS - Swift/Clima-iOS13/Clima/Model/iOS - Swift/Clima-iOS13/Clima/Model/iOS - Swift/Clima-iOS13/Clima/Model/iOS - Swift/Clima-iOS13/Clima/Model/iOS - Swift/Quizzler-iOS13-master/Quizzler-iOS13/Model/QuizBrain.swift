//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Laborit on 5/06/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Simón Bolivas was president of LATAM?", a: "False"),
        Question(q: " Sir. Pablo Escobar is stil alive?", a: "False"),
        Question(q: "Hugo Chavez Frías was bad person?", a: "True"),
        Question(q: "Juan Guadido did something for Venezuelan?", a: "False"),
        Question(q: "Everyone loves to Capriles Radoski?", a: "False"),
        Question(q: "The Arepa is from Colombian?", a: "False"),
        Question(q: "Peru is the mini-suiza of LATAM?", a: "False"),
        Question(q: "Pedro Castillo will be to president of Peru?", a: "True"),
        Question(q: "Keiko is good person?", a: "True"),
        Question(q: "Do you missing your Country?", a: "True"),
    ]
    
    var questionNumber = 0
    var score = 0
    //function with output
   mutating func checkAsnwer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
           score += 1
            return true
           
        } else {
            return false
        }
    }
    
    func getProgressBar() -> Float{
        return  Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getQuestionText() ->String {
        return quiz[questionNumber].text
    }
    
   mutating func nextQuestion(){
        //save to out range
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
