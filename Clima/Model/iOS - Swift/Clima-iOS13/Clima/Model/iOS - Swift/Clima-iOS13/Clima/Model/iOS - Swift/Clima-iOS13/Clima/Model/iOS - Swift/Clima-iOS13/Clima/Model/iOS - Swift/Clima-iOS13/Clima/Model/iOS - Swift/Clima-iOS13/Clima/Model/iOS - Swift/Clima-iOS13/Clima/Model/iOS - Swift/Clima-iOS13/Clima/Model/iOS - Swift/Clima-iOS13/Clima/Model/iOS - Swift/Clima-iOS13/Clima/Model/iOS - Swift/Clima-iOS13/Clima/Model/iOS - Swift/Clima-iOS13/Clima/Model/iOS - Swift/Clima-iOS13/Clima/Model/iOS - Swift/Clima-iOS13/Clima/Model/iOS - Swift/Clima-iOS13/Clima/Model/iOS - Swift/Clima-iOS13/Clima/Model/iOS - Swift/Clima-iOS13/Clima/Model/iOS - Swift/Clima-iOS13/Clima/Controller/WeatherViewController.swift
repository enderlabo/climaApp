//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Validate any word inside textField.
        searchTextField.delegate = self
    }


    @IBAction func searchBtn(_ sender: UIButton) {
        //when the user press keyword go or press the button search, the keyboard is hide.
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        
        return true
    }
    //when the user end to write and pressed keyword Go, the placeHOlder going to chances to Search Your City.
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != ""{
//            return true
//        } else {
//            textField.placeholder = "Search Your City"
//            return false
//        }
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use searchTextField.text to get the weather for that city.
        
//when the search is done, the state going to back to an empty string.
        searchTextField.text = ""
    }
}

