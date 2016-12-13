//
//  UtilC.swift
//  CFunction
//
//  Created by Shuvo on 12/11/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class UtilC {
    
    var result:Any? = nil
    
    init() {
        
    }
    
    func swiftTest() {
        print("\nClass UtilC\n")
        allFunctions()
    }
    
    func allFunctions() {
        
        var vInt32:Int32 = 23432
        var vInt8:Int8 = 23
        var vInt:Int = 2334
        let file = stdout
        var termiosStruc = termios()
        var winSize = winsize()
   //     var pid = __darwin_pid_t()
   //     var vIovec = iovec()
        let termiosPtr = ptrFromAddress(p: &termiosStruc)
        let winsizePtr = ptrFromAddress(p: &winSize)
        let vInt32Ptr = ptrFromAddress(p: &vInt32)
        let vInt8Ptr = ptrFromAddress(p: &vInt8)
        let vNIntPtr = ptrFromAddress(p: &vInt)
        let vIntPtr = ptrNotMutableFromAddress(p: &vInt8)
//        let pidPtr = ptrFromAddress(p: &pid)
//        let iovecPtr = ptrFromAddress(p: &vIovec)
        
        result = openpty(vInt32Ptr, vInt32Ptr, vInt8Ptr, termiosPtr, winsizePtr)
        print("result of openpty: \(result)")
        
        result = fparseln(file, vNIntPtr, vNIntPtr, vIntPtr, 32123)
        print("result of fparseln: \(result)")
        
        result = forkpty(vInt32Ptr, vInt8Ptr, termiosPtr, winsizePtr)
        print("result of forkpty: \(result)")
        
//        result = pidlock(vIntPtr, 3242, pidPtr, vIntPtr)
//        print("result of pidlock: \(result)")
//        
//        result = ttylock(vIntPtr, 4534, pidPtr)
//        print("result of ttylock: \(result)")
//        
//        result = ttyunlock(vIntPtr)
//        print("result of ttyunlock: \(result)")
//        
//        result = ttyaction(vInt8Ptr, vInt8Ptr, vInt8Ptr)
//        print("result of ttyaction: \(result)")
//        
//        result = ttymsg(iovecPtr, 56464, vIntPtr, 8598)
//        print("result of ttymsg: \(result)")
        
    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
    
    func ptrNotMutableFromAddress<T>(p:UnsafePointer<T>) -> UnsafePointer<T>
    {
        return p
    }
}
