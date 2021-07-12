//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
   
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatedUI()
    }

    @IBAction func actionBtn(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True or False
        let userRightAsnwer = quizBrain.checkAsnwer(userAnswer)
        
        if userRightAsnwer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
       
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updatedUI), userInfo: nil, repeats: false)
    }
    
    @objc func updatedUI(){
        questionText.text = quizBrain.getQuestionText()
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        //progressBar work with the count of question
        progressBar.progress = quizBrain.getProgressBar()
        scoreLabel.text = "Score: \(quizBrain.getScore())"        
    }
}
