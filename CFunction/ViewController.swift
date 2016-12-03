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
        
//        division()
//        stringCopy()
//        stringConcate()
//        stringCompare()
//        stringLength()
//        stringBreak()
//        randomValue()
//        math()
//        miscellaneous()
//        getFunction()
        
        StdLibC()
        MathC()
        StringC()
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
        print("string copied second time: \(destination)")                     //converting the c String to swift string
        
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
            print("str1 is less than str2")
        }
        else if(ret > 0)
        {
            print("str2 is less than str1")
        }
        else
        {
            print("str1 is equal to str2")
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
    
    func randomValue() {
        
        result = arc4random()
        print("Random Value: \(result!)")
        
        result = arc4random_stir()
        print("Random Value: \(result!)")
        
        result = arc4random_uniform(10)
        print("Random Value: \(result!)")
        
    }
    
    
    func math() {
        
        let PI = 3.14159265
        
        result = sqrt(100)
        print("square root value of 100 is: \(result!)")
        
        result = fabs(50.988888)
        print("absolute value of 50.988888 is: \(result!)")
        
        let x = 90.0;
        let val = PI / 180.0;
        let ret = cos( x*val )
        print("The cosine of \(x) is \(ret) degrees")
    }
    
    func miscellaneous() {
        
        result = srandom(200)
        print("miscellaneous random value: \(result!)")
        
        result = labs(43343435)
        print("labs result: \(result!)")
        
        let value = ldiv(300, 200)
        print("ldiv result div: \(value.quot) rem: \(value.rem)")
        
        let variable:Int64 = 4897987295723957209
        result = llabs(variable)
        print("llabs result: \(result!)")
        
        let dividend:Int64 = 4897987295723957209
        let divider:Int64 = 242342423
        let r = lldiv(dividend,divider)
        print("llabs result quot: \(r.quot) rem:\(r.rem)")
        
        let string = "H"
        let cs = string.cString(using: String.Encoding.utf8)!
        result = mblen(cs, 1)
        print("result of mblen: \(result!)")
        
        typealias set1 = (wchar_t, wchar_t, wchar_t, wchar_t, wchar_t)
        let string1 = "Hello"
        var cs1 = string1.cString(using: String.Encoding.windowsCP1254)!
        var stringSet1 = set1(wchar_t(cs1[0]), wchar_t(cs1[1]), wchar_t(cs1[2]), wchar_t(cs1[3]), wchar_t(cs1[4]))
        
        
        
        typealias set2 = (CChar, CChar, CChar, CChar, CChar)
        let string2 = "World"
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        var stringSet2 = set2(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4])
        
        result = mbtowc(&stringSet1.0,&stringSet2.0 ,5) 
        print("result of mbtowc: \(result!)")
        
        result = mbstowcs(&stringSet1.0,&stringSet2.0 ,5)
        print("result of mbstowcs: \(result!)")
        
      //  posix_memalign(_ __memptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>!, _ __alignment: Int, _ __size: Int) -> Int32
        

        let p = (calloc(1, MemoryLayout<Int>.size))
        print("calloc result : \(p!)")

        free(p)
        
        let q = malloc(5)
        print("malloc result : \(q!)")
        
        let x = realloc(q, 5)
        print("realloc result : \(x!)")
        
        
//        public func posix_memalign(_ __memptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>!, _ __alignment: Int, _ __size: Int) -> Int32
//        public func qsort(_ __base: UnsafeMutableRawPointer!, _ __nel: Int, _ __width: Int, _ __compar: @escaping @convention(c) (UnsafeRawPointer?, UnsafeRawPointer?) -> Int32
    
        

        
    }
    
    func getFunction() {
        
        typealias set = (CChar, CChar, CChar, CChar)
        
        let source = "PATH 12.3"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3])         
        result = getenv(&string.0)
        print("result of getenv function: \(result)")
        
//        typealias set1 = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
//        let string1 = "Hello 12.458345"
//        let cs1 = string1.cString(using: String.Encoding.utf8)!
//        var stringSet3 = set1(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], cs1[6], cs1[7], cs1[8], cs1[9], cs1[10], cs1[11], cs1[12], cs1[13], cs1[14])
//        let ptrI = UnsafeMutablePointer<Int8>.allocate(capacity: 4)
//        let ptrII = UnsafeMutablePointer<UnsafeMutablePointer<Int8>>.allocate(capacity: 4)
//        let test = strtod(&stringSet3.0, ptrII)
//        print("strtod result : \(test)")
        
        
    }

    func initRawAB() -> UnsafeMutableRawPointer {
        let intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 2)
        intPtr[0] = 42 // knowing A is layout compatible with Int
        intPtr[1] = 13 // knowing B is layout compatible with Int
        return UnsafeMutableRawPointer(intPtr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
