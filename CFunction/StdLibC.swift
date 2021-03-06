//
//  StdLibC.swift
//  CFunction
//
//  Created by Shuvo on 12/3/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class StdLibC  {
    
    var result:Any? = nil
    
    init()  {
 
    }
    
    func  swiftTest() {
        print("\nStdLibC Class\n")
        
        simpleFunctions()
        wcstombFunc()
        complexFunctions()
        sortingFunctions()
        sortingElementsByBlock()
    }
    
    func simpleFunctions() {
        
        result = arc4random()
        print("Random Value: \(result!)")
        
        result = arc4random_stir()
        print("Random Value: \(result!)")
        
        result = arc4random_uniform(10)
        print("Random Value: \(result!)")
        
        let value = div(5, 2)
        print("result division: \(value.quot) remainder: \(value.rem)")
        
        result = srandom(200)
        print("miscellaneous random value: \(result!)")
        
        result = labs(43343435)
        print("labs result: \(result!)")
        
        let val = ldiv(300, 200)
        print("ldiv result div: \(val.quot) rem: \(val.rem)")
        
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
        
        let myPtr = (calloc(1, MemoryLayout<Int>.size))
        print("calloc result : \(myPtr!)")
        
//        if let intPtr = myPtr?.bindMemory(to: Int32.self, capacity: 5) {
//
//            intPtr[0] = 123;
//            intPtr[1] = 321;
//
//            workWithIntPtr(intPtr)
//            
//            print("For calloc after calling C code, the 3rd, 4th and 5th element of the array is \(intPtr[2]) \(intPtr[3]) \(intPtr[4])")
//        }
//
//        free(myPtr)
        
        let q = malloc(5)
        print("malloc result : \(q!)")
    //    free(q)
        
//        if let intPtr = q?.bindMemory(to: Int32.self, capacity: 5) {
//            
//            intPtr[0] = 123;
//            intPtr[1] = 321;
//            
//            workWithIntPtr(intPtr)
//            
//            print("For malloc after calling C code, the 3rd, 4th and 5th element of the array is \(intPtr[2]) \(intPtr[3]) \(intPtr[4])")
//        }
        
        let x = realloc(q, 5)
        print("realloc result : \(x!)")
        free(q)
        
        typealias set = (CChar, CChar, CChar, CChar)
        
        let getsrc = "PATH 12.3"
        let getcs = getsrc.cString(using: String.Encoding.utf8)!
        
        var getString = set(getcs[0], getcs[1], getcs[2], getcs[3])
        result = getenv(&getString.0)
        print("result of getenv function: \(result)")
        
        var valI:Int8 = 123
        let add = ptrFromAddress(p: &valI)
        result = a64l(add)
        print("result of a641: \(result)")

        result = drand48()
        print("result of drand48: \(result)")
        
    }

    func wcstombFunc()  {
        
        var val:Int8 = 123
        let p = ptrFromAddress(p: &val)
        
        var valWchar:wchar_t = 1233432
        let q = ptrFromAddress(p: &valWchar)
        
        result = wcstombs(p, q, 5)
        print("result of wcstombs: \(result)")
        
        result = wctomb(p,valWchar)
        print("result of wctomb: \(result)")
        
    }
    

    func complexFunctions() {
        
        var val32:Int32 = 123
        let p = ptrFromAddress(p: &val32)
        
        result = ecvt(3434.0324, val32, p, p)
        print("result of ecvt: \(result)") 
        
        var valU16:UInt16 = 4342
        let pValU16 = ptrFromAddress(p: &valU16)
        
        result = erand48(pValU16)
        print("result of erand48: \(result)")
        
        result = fcvt(100, val32, p, p)
        print("result of fcvt: \(result)")
        
        var val8:Int8 = 12
        var val2:Int8 = 21
        let pVal8 = ptrFromAddress(p: &val8)
        let paVal8 = ptrFromAddress(p: &val2)
        
        result = gcvt(123.99, val32, pVal8)
        print("result of gcvt: \(result)")
        
        result = grantpt(3423235)
        print("result of grantpt: \(result)")
        
        let valU32:UInt32 = 34234
        result = initstate(valU32, pVal8, 3)
        print("result of inistate: \(result)")
        
        result = l64a(6)
        print("result of 164a: \(result)")
        
        result = lcong48(pValU16)
        print("result of lcong48: \(result)")
        
        result = posix_openpt(4323545)
        print("result of posix_openpt: \(result)")
        
        result = ptsname(45934859)
        print("result of ptsname: \(result)")
        
        result = putenv(pVal8)
        print("result of putenv: \(result)")
        
        result = realpath(pVal8, paVal8)
        print("result of realpath: \(result)")
        
        result = seed48(pValU16)
        print("result of seed48: \(result)")
        
        result = setenv(pVal8, paVal8, 453545)
        print("result of setenv: \(result)")
        
        result = setstate(pVal8)
        print("result of setstate: \(result)")
        
        result = unsetenv(pVal8)
        print("result of unsetenv: \(result)")
        
        result = abs(234243)
        print("result of abs: \(result)")
        
        result = atof(pVal8)
        print("result of atof: \(result)")
        
        result = atoi(pVal8)
        print("result of atoi: \(result)")
        
        result = atol(pVal8)
        print("result of atol: \(result)")
        
        result = atoll(pVal8)
        print("result of atoll: \(result)")
        
        let devT = __darwin_dev_t()
        let modeT = __darwin_mode_t()
        var val:Int = 324
        var valD:Double = 42.0
        let ptrValD = ptrFromAddress(p: &valD)
        let ptrVal = ptrFromAddress(p: &val)
        
        result = devname(devT, modeT)
        print("result of devname: \(result)")
        
        result = devname_r(devT, modeT, pVal8, 32423)
        print("result of devname_r: \(result)")
        
        result = getbsize(p, ptrVal)
        print("result of getbsize: \(result)")
        
        result = getloadavg(ptrValD, 343)
        print("result of getloadavg: \(result)")
        
        result = getprogname()
        print("result of getprogname: \(result)")
        
//        var values = [1,2,3]
//        result = realloc(&values, 3)
//        print("result of realloc: \(result)")

    }

    func sortingFunctions() {
        
        var numbers = [2,1,17,3]
        qsort(&numbers, numbers.count, MemoryLayout<Int>.stride) { a, b in
            let l: UnsafePointer<Int> = (a?.bindMemory(to: Int.self, capacity: 1))!
            let r: UnsafePointer<Int> = (b?.bindMemory(to: Int.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        print("sorted array of numbers for qsort: \(numbers)")
        
        numbers = [2,1,17,3]
        heapsort(&numbers, numbers.count, MemoryLayout<Int>.stride) { a, b in
            let l: UnsafePointer<Int> = (a?.bindMemory(to: Int.self, capacity: 1))!
            let r: UnsafePointer<Int> = (b?.bindMemory(to: Int.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        
        print("sorted array of numbers for heapsort: \(numbers)")
        
        numbers = [2,1,17,3,0]
        mergesort(&numbers, numbers.count, MemoryLayout<Int>.stride) { a, b in
            let l: UnsafePointer<Int> = (a?.bindMemory(to: Int.self, capacity: 1))!
            let r: UnsafePointer<Int> = (b?.bindMemory(to: Int.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        
        print("sorted array of numbers for mergesort: \(numbers)")
        
        numbers = [2,1,17,3,0]
        psort(&numbers, numbers.count, MemoryLayout<Int>.stride) { a, b in
            let l: UnsafePointer<Int> = (a?.bindMemory(to: Int.self, capacity: 1))!
            let r: UnsafePointer<Int> = (b?.bindMemory(to: Int.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        
        print("sorted array of numbers for psort: \(numbers)")
        
    }
    
    
    func sortingElementsByBlock() {
        
        let numbers = [2,1,17,3]
        let strs = ["hello","world","HELLO", "WORLD"]
        
        print("result of block quickSort of string: \(quickSort(input: strs))")
        print("result of block quickSort of int: \(quickSort(input: numbers))")
        
        print("result of block heapSort of string: \(heapSort(input: strs))")
        print("result of block heapSort of int: \(heapSort(input: numbers))")
        
        print("result of block mergeSort of string: \(mergeSort(input: strs))")
        print("result of block mergeSort of int: \(mergeSort(input: numbers))")
        
        print("result of block pSort of string: \(pSort(input: strs))")
        print("result of block pSort of int: \(pSort(input: numbers))")
    }
    
    func quickSort<A: Comparable> ( input: [A]) -> [A] {
        
        var input = input
        qsort_b(&input, input.count, MemoryLayout<A>.stride) { a, b in
            let l: UnsafePointer<A> = (a?.bindMemory(to: A.self, capacity: 1))!
            let r: UnsafePointer<A> = (b?.bindMemory(to: A.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        return input
    }
    
    func heapSort<A: Comparable> ( input: [A]) -> [A] {
        
        var input = input
        heapsort_b(&input, input.count, MemoryLayout<A>.stride) { a, b in
            let l: UnsafePointer<A> = (a?.bindMemory(to: A.self, capacity: 1))!
            let r: UnsafePointer<A> = (b?.bindMemory(to: A.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        return input
    }
    
    func mergeSort<A: Comparable> ( input: [A]) -> [A] {
        
        var input = input
        mergesort_b(&input, input.count, MemoryLayout<A>.stride) { a, b in
            let l: UnsafePointer<A> = (a?.bindMemory(to: A.self, capacity: 1))!
            let r: UnsafePointer<A> = (b?.bindMemory(to: A.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        return input
    }
    
    func pSort<A: Comparable> ( input: [A]) -> [A] {
        
        var input = input
        psort_b(&input, input.count, MemoryLayout<A>.stride) { a, b in
            let l: UnsafePointer<A> = (a?.bindMemory(to: A.self, capacity: 1))!
            let r: UnsafePointer<A> = (b?.bindMemory(to: A.self, capacity: 1))!
            return r.pointee > l.pointee ? -1 : (r.pointee == l.pointee ? 0 : 1)
        }
        return input
    }
    
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
    
}


//    func strtodC() {

//        var xStr:Int8 = 123
//        let yStr:Int8 = 5
//
//        let x : UnsafePointer<Int8>? = nil
//        let y : UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>? = nil
//
//        result = strtod(x, y)
//        print("result of strtod: \(result)")
//
//        var nInt:Int8 = 123
//        let p = ptrFromAddress(p: &nInt)
//
//
//        var nestedInt:Int8 = 5
//        var r = ptrFromAddress(p: &nestedInt)
//        let s = ptrFromAddress(p: &r)
//
//        result = strtod(p,s)

//        withUnsafeMutablePointer(&nInt) { (var w) in
//
//        }
//
//        withUnsafeMutablePointer(&myInt) { (var p) in
//            withUnsafeMutablePointer(&p) { (var pp) in
//
//            }
//        }
//
//        // sting copy method with safe memory allocation
//        withUnsafeMutablePointer(to: &string1) { str1Ptr in
//            withUnsafePointer(to: &string2) { str2Ptr in
//                    _ = strcpy(str1Ptr, str2Ptr)
//            }
//        }
//    }
