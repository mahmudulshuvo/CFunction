//
//  TimeC.swift
//  CFunction
//
//  Created by Shuvo on 12/5/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation


class TimeC  {
    
    var result:Any? = nil
    
    init() {
        
    }
    
    func  swiftTest() {
        print("\nTime Class\n")
        timeCfunction()
    }
    
    func timeCfunction() {
        
        var valTime:time_t = 432
        let valTime2:time_t = 674
        let pValTime = ptrFromAddress(p: &valTime)
        
        var val8:Int8 = 12
        let pVal8 = ptrFromAddress(p: &val8)
        
        result = time(pValTime)
        print("result of time: \(result!)")
        
        result = clock()
        print("result of clock: \(result!)")
        
        result = ctime(pValTime)
        print("result of ctime: \(result!)")
        
        result = difftime(valTime, valTime2)
        print("result of difftime: \(result!)")
        
        result = getdate(pVal8)
        print("result of getdate: \(result)")
        
        result = gmtime(pValTime)
        print("result of gmtime: \(result!)")
        
        result = localtime(pValTime)
        print("result of localTime: \(result!)")
        
//        free(pValTime)
//        free(pVal8)
        
    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
