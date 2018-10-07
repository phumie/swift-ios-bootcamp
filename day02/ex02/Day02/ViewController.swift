//
//  ViewController.swift
//  day02
//
//  Created by Phumudzo NEVHUTALA on 2018/10/03.
//  Copyright © 2018 Phumudzo NEVHUTALA. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var deathTable: UITableView! {
        didSet {
            deathTable.delegate = self;
            deathTable.dataSource = self;
        }
    }
    
    var deathNames : [(String, String)] = [
        ("Michael 2019-01-01 13:53:13", "Choke on a jalapeno popper"),
        ("Toni 2018-07-12 07:45:45", "Snap a neck"),
        ("Puleng 2022-04-09 14:14:14", "Car accident")
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deathNames.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = deathTable.dequeueReusableCell(withIdentifier: "deathCell");
        cell?.textLabel?.text = deathNames[indexPath.row].0
        cell?.detailTextLabel?.text = deathNames[indexPath.row].1
        return cell!;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

