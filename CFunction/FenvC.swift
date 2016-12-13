//
//  FenvC.swift
//  CFunction
//
//  Created by Shuvo on 12/13/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class FenvC {
    
    var result:Any? = nil
    
    init() {
        
    }
    
    func swiftTest() {
        print("\nClass Fenv\n")
        allFunctions()
    }
    
    func allFunctions() {
        
        var val:fexcept_t = 322
        let ptrVal = ptrFromAddress(p: &val)
        var valFen = fenv_t.init(__control: 434, __status: 22, __mxcsr: 34, __reserved: (Int8(2),Int8(3),Int8(4),Int8(5),Int8(6),Int8(7),Int8(8),Int8(9)))
        let ptrValFen = ptrFromAddress(p: &valFen)
        
        
        result = feclearexcept(232)
        print("result of feclearexcept: \(result)")
        
        result = fegetexceptflag(ptrVal, 32)
        print("result of fegetexceptflag: \(result)")
        
        result = feraiseexcept(324)
        print("result of feraiseexcept: \(result)")
        
        result = fesetexceptflag(ptrVal, 3467)
        print("result of fesetexceptflag: \(result)")
        
        result = fetestexcept(2343)
        print("result of fetestexcept: \(result)")
        
        result = fegetround()
        print("result of fegetround: \(result)")
        
        result = fesetround(4545)
        print("result of fesetround: \(result)")
        
        result = fegetenv(ptrValFen)
        print("result of fegetenv: \(result)")
        
        result = feholdexcept(ptrValFen)
        print("result of feholdexcept: \(result)")
        
        result = fesetenv(ptrValFen)
        print("result of fesetenv: \(result)")
        
        result  = feupdateenv(ptrValFen)
        print("result of feupdateenv: \(result)")

        
    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
