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
        
        division()
        stringCopy()
        stringConcate()
        stringCompare()
        stringLength()
        stringBreak()
    }
    
    func division() {
        
        let value = div(5, 2)
        print("result division: \(value.quot) remainder: \(value.rem)")
    }
    
    
    func stringCopy() {
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string1 = set(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        var string2 = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11])
        
        // sting copy method with unsafe memory allocation
        strcpy(&string1.0, &string2.0)
        var destination = String(validatingUTF8: &string1.0)!                   //converting the c String to swift string
        print("String copied first time: \(destination)")
        destination = ""
        
        // sting copy method with safe memory allocation
        withUnsafeMutablePointer(to: &string1) {
            $0.withMemoryRebound(to: CChar.self, capacity: 12) { str1Ptr in
                withUnsafePointer(to: &string2) {
                    $0.withMemoryRebound(to: CChar.self, capacity: 12) { str2Ptr in
                        _ = strcpy(str1Ptr, str2Ptr)
                    }
                }
            }
        }
        
        destination = String(validatingUTF8: &string1.0)!
        print("string copied second time: \(destination)")                 //converting the c String to swift string
        
        if(destination == source) {
            print("string copied")
        }
    }
    
    func stringConcate() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        strcat(&stringset1.0, &stringset2.0)
        let destination = String(validatingUTF8: &stringset1.0)!                   //converting the c String to swift string
        print("concatenation value: \(destination)")
        
    }
    
    
    func stringCompare() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar)
        
        var string1 = "Hello"
        var string2 = "World"
        
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4])
        
        var ret = strcmp(&stringset1.0, &stringset2.0)

        if(ret < 0)
        {
            print("str1 is less than str2");
        }
        else if(ret > 0)
        {
            print("str2 is less than str1");
        }
        else
        {
            print("str1 is equal to str2");
        }
        
        
        
        string1 = "Hello"
        string2 = "Hello"
        
        cs1 = string1.cString(using: String.Encoding.utf8)!
        cs2 = string2.cString(using: String.Encoding.utf8)!
        
        stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4])
        
        ret = strcmp(&stringset1.0, &stringset2.0)
        
        if(ret < 0)
        {
            print("str1 is less than str2");
        }
        else if(ret > 0)
        {
            print("str2 is less than str1");
        }
        else
        {
            print("str1 is equal to str2");
        }
        
    }
    
    func stringLength() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        let len = strlen(&string.0)
        
        print("length: \(len)")
    }
    
    
    func stringBreak() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "abcde2fghi3jk4l"
        var string2 = "34"
        
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], cs1[6], cs1[7], cs1[8], cs1[9], cs1[10], cs1[11], cs1[12], cs1[13], cs1[14])
        var stringset2 = set(cs2[0], cs2[1], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        
        var ret = strpbrk(&stringset1.0, &stringset2.0)
        
        if ret != nil {
            
            let dest = String(validatingUTF8: ret!)!
            print("First matching character set: \(dest)")

        }
        
        else
        {
            print("Character not found");
        }
        
        
        string2 = "uu"
        
        cs1 = string1.cString(using: String.Encoding.utf8)!
        cs2 = string2.cString(using: String.Encoding.utf8)!
        
        stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], cs1[6], cs1[7], cs1[8], cs1[9], cs1[10], cs1[11], cs1[12], cs1[13], cs1[14])
        stringset2 = set(cs2[0], cs2[1], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        
        ret = strpbrk(&stringset1.0, &stringset2.0)
        
        if ret != nil {
            
            let dest = String(validatingUTF8: ret!)!
            print("First matching character set: \(dest)")
            
        }
            
        else
        {
            print("Character not found");
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

