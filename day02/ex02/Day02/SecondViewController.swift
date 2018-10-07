//
//  SecondViewController.swift
//  day02
//
//  Created by Phumudzo NEVHUTALA on 2018/10/04.
//  Copyright © 2018 Phumudzo NEVHUTALA. All rights reserved.
//

import UIKit

var name : String = ""
var descript : String = ""
var date : String = ""
var clicked : Bool = false;

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var deathDate: UIDatePicker!
    
    let currentDate = Date();
    
    
    
    @IBAction func doneBtn(_ sender: Any) {
        if (nameField.text != ""){
            name = nameField.text!;
            print("Name: " + name);
        }
        else{
            print("Name field cannot be empty");
        }
        if (descriptionField.text != ""){
            descript = descriptionField.text!;
            print("Death description: " + descript);
        }
        else {
            descript = "";
            print("Death description: null");
        }
        
        date = "\(deathDate.date)";
        
        if (date != ""){
           print("Death Date: " + date);
        }
        else{
            print("Death Date cannot be empty");
        }
        clicked = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deathDate.setDate(Date(), animated: true);
        deathDate.minimumDate = Date();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
