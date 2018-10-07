//
//  ViewController.swift
//  ex02
//
//  Created by Phumudzo NEVHUTALA on 2018/10/01.
//  Copyright © 2018 Phumudzo NEVHUTALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayNum : Double = 0;
    var previousNumber : Double = 0;
    var container : String = "";
    var holder : String = "";
    var total : Double = 0;
    var num : Double = 0;
    var error : Double = 0;
    var mathPerformed = false;
    var operation = 0;

    @IBOutlet weak var calcLabel: UILabel!

    func build(number : Int) -> String{
        holder = holder + String(number);
        return (holder);
    }
    @IBAction func numbers(_ sender: UIButton) {
        if (mathPerformed == true){
            if (sender.tag == 17){
                if (previousNumber > 0){
                    previousNumber = -1 * Double(calcLabel.text!)!;
                    calcLabel.text = String(previousNumber);
                    print("Value changed to: " + String(previousNumber));
                }
            }
            else{
                calcLabel.text = build(number: sender.tag - 1);
                previousNumber = Double(calcLabel.text!)!;
                container = container + String(previousNumber) + " ";
                print("Number pressed: " + String(previousNumber));
            }
        }
        else{
            if (sender.tag == 17){
                if (displayNum > 0){
                    displayNum = -1 * Double(calcLabel.text!)!;
                    calcLabel.text = String(displayNum);
                    print("Value changed to: " + String(displayNum));
                }
            }
            else{
                calcLabel.text = build(number: sender.tag - 1);
                displayNum = Double(calcLabel.text!)!;
                container = container + String(displayNum) + " ";
                print("Number pressed: " + String(displayNum));
            }
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        //check if calcLabel is not empty, and that the buttons pressed are not AC and =
        holder = "";
        if (calcLabel.text != "" && sender.tag != 16 && sender.tag != 11) {
            
            if (sender.tag == 12){
                calcLabel.text = "/";
                container = container + "/ ";
                print("Operator pressed: " + "/");
            }
            if (sender.tag == 13){
                calcLabel.text = "*";
                container = container + "* ";
                print("Operator pressed: " + "*");
            }
            if (sender.tag == 14){
                calcLabel.text = "-";
                container = container + "- ";
                print("Operator pressed: " + "-");
            }
            if (sender.tag == 15){
                calcLabel.text = "+";
                container = container + "+ ";
                print("Operator pressed: " + "+");
            }
            
            operation = sender.tag;
            mathPerformed = true;
        }
        
        else if (sender.tag == 16){
            let array = container.components(separatedBy: " ");
            var index : Int = 0;
            
            while (array.count > index){
                if (Double(array[index]) != nil){
                    if (num == 0){
                        total = Double(array[index])!;
                        num = 1;
                    }
                }
                else if (array[index] == "/"){
                    if (Double(array[index + 1]) == nil){
                        calcLabel.text = "Error";
                        error = -1;
                        break;
                    }
                    else{
                        if (Double(array[index + 1])! == 0){
                            calcLabel.text = "Error";
                            error = -1;
                            break;
                        }
                        else{
                            total = total / Double(array[index + 1])!;
                        }
                    }
                }
                else if (array[index] == "*"){
                    if (Double(array[index + 1]) == nil){
                        calcLabel.text = "Error";
                        error = -1;
                        break;
                    }
                    else{
                        total = total * Double(array[index + 1])!;
                    }
                }
                else if (array[index] == "+"){
                    if (Double(array[index + 1]) == nil){
                        calcLabel.text = "Error";
                        error = -1;
                        break;
                    }
                    else{
                       total = total + Double(array[index + 1])!;
                    }
                }
                else if (array[index] == "-"){
                    if (Double(array[index + 1]) == nil){
                        calcLabel.text = "Error";
                        error = -1;
                        break;
                    }
                    else{
                        total = total - Double(array[index + 1])!;
                    }
                }
                index = index + 1;
            }
            
            if (error == -1){
                calcLabel.text = "Error";
                container = "";
                print("Error");
            }
            else{
               calcLabel.text = String(total);
                container = "";
                container = String(total) + " ";
                print("Total number is: " + String(total));
            }
        }
        
        else if (sender.tag == 11){
            calcLabel.text = "";
            holder = "";
            container = "";
            total = 0;
            num = 0;
            error = 0;
            previousNumber = 0;
            displayNum = 0;
            operation = 0;
            print("Screen cleared");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

