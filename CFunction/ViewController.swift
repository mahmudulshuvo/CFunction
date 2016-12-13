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
        
        let std = StdLibC()
        let mathC = MathC()
        let stringC = StringC()
        let timeC = TimeC()
        let ctypeC = CtypeC()
        let utilC = UtilC()
        let copyfileC = CopyfileC()
        let fenvC = FenvC()
        let errC = ErrorC()
        let fileC = FileC()
        
        print("\(copyfileC.swiftTest())")
        print("\(fenvC.swiftTest())")
        print("\(errC.swiftTest())")
        print("\(utilC.swiftTest())")
        print("\(ctypeC.swiftTest())")
        print("\(std.swiftTest())")
        print("\(mathC.swiftTest())")
        print("\(stringC.swiftTest())")
        print("\(timeC.swiftTest())")
        print("\(fileC.swiftTest())")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
