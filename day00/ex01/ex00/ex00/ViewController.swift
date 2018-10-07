//
//  ViewController.swift
//  ex00
//
//  Created by Phumudzo NEVHUTALA on 2018/10/01.
//  Copyright © 2018 Phumudzo NEVHUTALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var helloLabel: UILabel!
//    @IBAction func clickBtn(_ sender: UIButton) {
//        helloLabel.text = "Hello World!";
//    }
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        helloLabel.text = "Hello World!";
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

