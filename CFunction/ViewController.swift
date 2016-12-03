//
//  ViewController.swift
//  CFunction
//
//  Created by Shuvo on 11/29/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result:Any? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        StdLibC()
        MathC()
        StringC()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
