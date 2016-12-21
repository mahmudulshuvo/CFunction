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
        
        var valTm = tm()
        let ptrTm = ptrFromAddress(p: &valTm)
        result = mktime(ptrTm)
        print("result of mktime: \(result)")
        
        result = strftime(pVal8, 2, pVal8, ptrTm)
        print("result of strftime: \(result)")
        
        result = strptime(pVal8, pVal8, ptrTm)
        print("result of strptime: \(result)")
        
        result = time(pValTime)
        print("result of time: \(result)")
        
        result = tzset()
        print("result of tzset: \(result)")
        
        result = asctime(ptrTm)
        print("result of asctime: \(result)")
        
        result = ctime_r(pValTime, pVal8)
        print("result of ctime_r: \(result)")
        
        result = gmtime_r(pValTime, ptrTm)
        print("result of gmtime_r: \(result)")
        
        result = localtime_r(pValTime, ptrTm)
        print("result of localtime_r: \(result)")
        
        result = posix2time(valTime2)
        print("result of posix2time: \(result)")
        
        result = tzsetwall()
        print("result of tzsetwall: \(result)")
        
        result = time2posix(valTime2)
        print("result of time2posix: \(result)")
        
        result = timelocal(ptrTm)
        print("result of timelocal: \(result)")
        
        result = timegm(ptrTm)
        print("result of timegm: \(result)")
        
        var valTmSpec = timespec()
        let ptrTmSpec = ptrFromAddress(p: &valTmSpec)
        
        result = nanosleep(ptrTmSpec, ptrTmSpec)
        print("result of nanosleep: \(result)")        
    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
