//
//  CopyfileC.swift
//  CFunction
//
//  Created by Shuvo on 12/13/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class CopyfileC {
    
//    public typealias copyfile_state_t = OpaquePointer
//    public typealias copyfile_flags_t = UInt32
    var result:Any? = nil

    init() {
        
    }
    
    func swiftTest() {
        
        print("\nCopyfile Class\n")
        allFunctions()
    }
    
    func allFunctions() {
        
        var vInt8:Int8 = 22
        let pVint8 = ptrFromAddress(p: &vInt8)
        
        var vAInt8:Int8 = 33
        let paVint8 = ptrFromAddress(p: &vAInt8)
        
        let rawPtr = ptrAFromAddress(p: &vInt8)
        
        let copyfile_flags_t:UInt32 = 64
        
        let copyfile_state_t  = copyfile_state_alloc()
        
        result = fcopyfile(222, 321, copyfile_state_t, copyfile_flags_t)
        print("result of fcopyfile: \(result)")
        
        result = copyfile_state_get(copyfile_state_t, 213, rawPtr)
        print("result of copyfile_state_get: \(result)")
        
        result = copyfile_state_set(copyfile_state_t, 32, rawPtr)
        print("result of copyfile_state_set : \(result)")
        
        result = copyfile(pVint8, paVint8, copyfile_state_t, copyfile_flags_t)
        print("result of copyfile: \(result)")
        
        result = copyfile_state_free(copyfile_state_t)
        print("result of fcopyfile: \(result)")
        
        
    }
    
    func ptrFromAddress<T>(p:UnsafePointer<T>) -> UnsafePointer<T>
    {
        return p
    }
    
    func ptrAFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
