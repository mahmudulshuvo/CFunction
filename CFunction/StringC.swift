//
//  StringC.swift
//  CFunction
//
//  Created by Shuvo on 12/3/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class StringC  {
     var result:Any? = nil
    
    init()  {

    }
    
    func  swiftTest() {
        print("\nString Class\n")
        
        memChar()
        memCmp()
        memCpy()
        memMove()
        memSet()
        strChar()
        strColl()
        stringCopy()
        stringConcate()
        stringCompare()
        strcSpn()
        strError()
        stringLength()
        strnCat()
        strnCmp()
        strnCpy()
        stringBreak()
        strrChar()
        strSpn()
        strStr()
        strTok()
        strxFrm()
        strError_r()
        strDup()
        memcCpy()
        stpCpy()
        stpnCpy()
        strnDup()
        strnLen()
        strSignal()
        memSet_s()
        memMem()
        memSet_pattern4()
        memSet_pattern8()
        memSet_pattern16()
        strCaseStr()
        strnStr()
        strlCat()
        strlCpy()
        strMode()
        timingSafe_bcmp()
    }

    func memChar() {
        let s = initRawAB()
        result = memchr(s, 2, 2)
        print("result of memChar: \(result)")
    }
    
    func memCmp() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memcmp(s, r, 2)
        print("result of memCmp: \(result)")
    }
    
    func memCpy() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memcpy(s, r, 2)
        print("result of memcpy: \(result)")
    }
    
    func  memMove() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memmove(s, r, 2)
        print("result of memmove: \(result)")
    }
    
    func memSet() {
        
        let s = initRawAB()
        result = memset(s, 2, 2)
        print("result of memset: \(result)")
    }
    
    
    func strChar() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar)
        let string1 = "Hello"
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        result = strchr(&stringset1.0,1)
        print("result of strChar: \(result)")
    }
    
    func strColl() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello"
        let string2 = "World"
        
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4])
        
        let ret = strcoll(&stringset1.0, &stringset2.0)
        
        if(ret < 0)
        {
            print("str1 is less than str2 in strColl")
        }
        else if(ret > 0)
        {
            print("str2 is less than str1 in strColl")
        }
        else
        {
            print("str1 is equal to str2 in strColl")
        }

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
            print("str1 is less than str2 in stringCompare")
        }
        else if(ret > 0)
        {
            print("str2 is less than str1 in stringCompare")
        }
        else
        {
            print("str1 is equal to str2 in stringCompare")
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
            print("str1 is less than str2 in stringCompare")
        }
        else if(ret > 0)
        {
            print("str2 is less than str1 in stringCompare")
        }
        else
        {
            print("str1 is equal to str2 in stringCompare")
        }
        
    }
    
    
    func strcSpn()  {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello"
        let string2 = "World"
        
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4])
        
        let ret = strcspn(&stringset1.0, &stringset2.0)
        
        if(ret < 0)
        {
            print("str1 is less than str2 in strcSpn")
        }
        else if(ret > 0)
        {
            print("str2 is less than str1 in strcSpn")
        }
        else
        {
            print("str1 is equal to str2 in strcSpn")
        }

    }
    
    func strError() {
        
        result = strerror(10)
        print("result of strerror: \(result!)")
    }
    
    func stringLength() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        let len = strlen(&string.0)
        
        print("stringLength: \(len)")
    }
    
    func strnCat() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        strncat(&stringset1.0, &stringset2.0, 3)
        let destination = String(validatingUTF8: &stringset1.0)!                   //converting the c String to swift string
        print("result of strnCat: \(destination)")
    }
    
    func strnCmp() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strncmp(&stringset1.0, &stringset2.0, 3)                  //converting the c String to swift string
        print("result of strnCmp: \(result!)")
        
    }
    
    func strnCpy() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strncpy(&stringset1.0, &stringset2.0, 3)                  //converting the c String to swift string
        print("result of strnCpy: \(result!)")
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
            print("Character not found")
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
            print("Character not found")
        }
        
    }
    
    func strrChar() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar)
        let string1 = "Hello"
        var cs1 = string1.cString(using: String.Encoding.utf8)!
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4])
        result = strrchr(&stringset1.0,1)
        print("result of strrChar: \(result)")
    }
    
    func strSpn() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strspn(&stringset1.0, &stringset2.0)                  //converting the c String to swift string
        print("result of strSpn: \(result!)")
        
    }
    
    func strStr() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strstr(&stringset1.0, &stringset2.0)                  //converting the c String to swift string
        print("result of strStr: \(result)")
    }
    
    func strTok() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strtok(&stringset1.0, &stringset2.0)                  //converting the c String to swift string
        print("result of strTok: \(result!)")
        
    }
    
    func strxFrm() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strxfrm(&stringset1.0, &stringset2.0,3)                  //converting the c String to swift string
        print("result of strxFrm: \(result!)")
    }
    
    
    func strError_r() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        result = strerror_r(5, &string.0, 12)
        print("result of strError_r: \(result)")
    }
    
    func strDup() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        result = strdup(&string.0)
        print("result of strDup: \(result)")
    }
    
    func memcCpy() {
        let s = initRawAB()
        let r = initRawCD()
        result = memccpy(s, r, 2, 2)
        print("result of memcCpy: \(result)")
    }
    
    
    func stpCpy() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = stpcpy(&stringset1.0, &stringset2.0)                  //converting the c String to swift string
        print("result of stpCpy: \(result!)")
    }
    
    
    func stpnCpy()  {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = stpncpy(&stringset1.0, &stringset2.0, 4)                  //converting the c String to swift string
        print("result of stpnCpy: \(result!)")
    }
    
    func strnDup() {
        
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        result = strndup(&string.0, 5)
        
        print("result of strnDup: \(result)")
    }
    
    func strnLen()  {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        
        result = strnlen(&string.0, 5)
        
        print("result of strnLen: \(result!)")
        
    }
    
    func strSignal()  {
        
        result = strsignal(64)
        print("result of strSignal: \(result!)")
    }
    
    
    func memSet_s() {
        
        let s = initRawCD()
        result = memset_s(s, 2, 2, 2)
        print("result of memSet_s: \(result)")
    }
    
    func memMem() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memmem(s, 3, r, 2)
        print("result of memMem: \(result)")
    }
    
    
    func memSet_pattern4() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memset_pattern4(s,r,2)
        print("result of memSet_pattern4: \(result)")
    }
    
    func memSet_pattern8() {
    
        let s = initRawAB()
        let r = initRawCD()
        result = memset_pattern4(s,r,2)
        print("result of memSet_pattern8: \(result)")
    }
    
    func memSet_pattern16() {
        
        let s = initRawAB()
        let r = initRawCD()
        result = memset_pattern16(s,r,2)
        print("result of memSet_pattern16: \(result)")
    }
    
    func strCaseStr() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strcasestr(&stringset1.0, &stringset2.0)                  //converting the c String to swift string
        print("result of strCaseStr: \(result)")
    }
    
    func strnStr() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strnstr(&stringset1.0, &stringset2.0, 4)                  //converting the c String to swift string
        print("result of strnStr: \(result)")
    }
    
    func strlCat() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strlcat(&stringset1.0, &stringset2.0, 5)                  //converting the c String to swift string
        print("result of strnStr: \(result)")
    }
    
    func strlCpy() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        
        let string1 = "Hello "
        let string2 = "World!"
        
        let cs1 = string1.cString(using: String.Encoding.utf8)!
        let cs2 = string2.cString(using: String.Encoding.utf8)!
        
        var stringset1 = set(cs1[0], cs1[1], cs1[2], cs1[3], cs1[4], cs1[5], 0, 0, 0, 0, 0, 0)
        var stringset2 = set(cs2[0], cs2[1], cs2[2], cs2[3], cs2[4], cs2[5], 0, 0, 0, 0, 0, 0)
        
        result = strlcat(&stringset1.0, &stringset2.0, 5)                  //converting the c String to swift string
        print("result of strlcpy: \(result)")
    }
    
    func strMode() {
        
        typealias set = (CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar, CChar)
        let source = "Hello World!"
        let cs = source.cString(using: String.Encoding.utf8)!
        var string = set(cs[0], cs[1], cs[2], cs[3], cs[4], cs[5], cs[6], cs[7], cs[8], cs[9], cs[10], cs[11], 0, 0, 0)
        result = strmode(4, &string.0)
        
        print("result of strMode: \(result)")
    }

    
    func timingSafe_bcmp() {
        let s = initRawAB()
        let r = initRawCD()
        result = timingsafe_bcmp(s,r,2)
        print("result of timingSafe_bcmp: \(result)")
    }
    
    func initRawAB() -> UnsafeMutableRawPointer {
        let intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 3)
        intPtr[0] = 42
        intPtr[1] = 13
        intPtr[1] = 64
        return UnsafeMutableRawPointer(intPtr)
    }
    
    func initRawCD() -> UnsafeMutableRawPointer {
        let intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 2)
        intPtr[0] = 22 
        intPtr[1] = 43
        return UnsafeMutableRawPointer(intPtr)
    }
}
