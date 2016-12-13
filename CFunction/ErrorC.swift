//
//  ErrorC.swift
//  CFunction
//
//  Created by Shuvo on 12/13/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class ErrorC {
    
    var result:Any? = nil
    
    init() {
        
    }
    
    func swiftTest() {
        print("\nError Class\n")
        allFunctions()
    }
    
    func allFunctions() {
        
        var vInt8:Int8 = 11
        let ptrVInt8 = ptrFromAddress(p: &vInt8)
        
        
        let args: [CVarArg] = [ "foo", 12, 34.56 ]
        let listArgs = getVaList(args)

        result = vwarn(ptrVInt8, listArgs)
        print("result of verr :\(result)")
        
        result = vwarnc(2432, ptrVInt8, listArgs)
        print("result of vwarnc: \(result)")
        
        result = err_set_file(malloc(5))
        print("result of err_set_file: \(result)")
        
    }
    
    func ptrFromAddress<T>(p:UnsafePointer<T>) -> UnsafePointer<T>
    {
        return p
    }
}

