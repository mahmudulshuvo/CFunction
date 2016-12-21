//
//  CtypeC.swift
//  CFunction
//
//  Created by Shuvo on 12/10/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation


class CtypeC  {
    
    var result:Any? = nil
    typealias __darwin_ct_rune_t = CInt
    
    init()  {
        
    }
    
    func  swiftTest() {
        print("\nCtype Class\n")
        allFunctions()
        
    }
    
    func allFunctions() {
        
        result = ___runetype(__darwin_ct_rune_t.max)
        print("result of ___runtype: \(result!)")
        
        result = ___tolower(__darwin_ct_rune_t.min)
        print("result of ___tolower: \(result!)")
        
        result = ___toupper(__darwin_ct_rune_t.min)
        print("result of ___toupper: \(result!)")
        
        result = isascii(32434)
        print("result of isascii: \(result!)")
        
        result = __maskrune(__darwin_ct_rune_t.max,20)
        print("result of __maskrune: \(result!)")
        
        result = __istype(__darwin_ct_rune_t.min,40)
        print("result of __istype: \(result!)")
        
        result = __isctype(__darwin_ct_rune_t.min,40)
        print("result of __isctype: \(result!)")
        
        result = __toupper(__darwin_ct_rune_t.max)
        print("result of __toupper: \(result!)")
        
        result = __tolower(__darwin_ct_rune_t.max) 
        print("result of __tolower: \(result!)")
        
        result = __wcwidth(__darwin_ct_rune_t.max)
        print("result of __wcwidth: \(result!)")
        
        result = isalnum(200)
        print("result of isalnum: \(result!)")
        
        result = isalpha(123)
        print("result of isalpha: \(result!)")
        
        result = isblank(345)
        print("result of isblank: \(result!)")
        
        result = iscntrl(234)
        print("result of iscntrl: \(result!)")
        
        result = isdigit(111)
        print("result of isdigit: \(result!)")

        result = isgraph(453)
        print("result of isgraph: \(result!)")
        
        result = islower(111)
        print("result of islower: \(result!)")
        
        result = isprint(232)
        print("result of isprint: \(result!)")
        
        result = ispunct(111)
        print("result of ispunct: \(result!)")
        
        result = isspace(222)
        print("result of isspace: \(result!)")
        
        result = isupper(333)
        print("result of isupper: \(result!)")
        
        result = isxdigit(222)
        print("result of isxdigit: \(result!)")
        
        result = toascii(222)
        print("result of toascii: \(result!)")
        
        result = tolower(222)
        print("result of tolower: \(result!)")
        
        result = toupper(222)
        print("result of toupper: \(result!)")
        
        result = digittoint(222)
        print("result of digittoint: \(result!)")
        
        result = ishexnumber(222)
        print("result of ishexnumber: \(result!)")
        
        result = isideogram(222)
        print("result of isideogram: \(result!)")
        
        result = isnumber(222)
        print("result of isnumber: \(result!)")
        
        result = isphonogram(222)
        print("result of isphonogram: \(result!)")
        
        result = isrune(222)
        print("result of isrune: \(result!)")
        
        result = isspecial(222)
        print("result of isspecial: \(result!)")
        
    }
    
}
