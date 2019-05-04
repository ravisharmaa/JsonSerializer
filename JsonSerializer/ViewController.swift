//
//  ViewController.swift
//  JsonSerializer
//
//  Created by Ravi Bastola on 5/4/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func fetchData(_ sender: Any) {
        performSegue(withIdentifier: "apiSegue", sender: nil)
    }
    
}

