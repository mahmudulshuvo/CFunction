//
//  MathC.swift
//  CFunction
//
//  Created by Shuvo on 12/3/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class MathC  {
    
    var result:Any? = nil
    let PI = 3.14159265
    
    init()  {

    }
    
    func  swiftTest() {
        print("\nMathC Class\n")
        
        simpleFunctions()
        complexFunctions()
    }
    
    
    func simpleFunctions() {
        
        let x = 90.0
        let y = 60.0
        var fVal:Float = 23.45
        var dVal:Double = 53453.243245
        var iVal:Int32 = 5454353
        
        let valX = PI / 180.0 * x
        let valY = PI / 180.0 * y
        
        var ret = acosf( Float(valX) )
        print("The acosf of \(x) is \(ret) degrees")
        
        ret = acos( Float(valX) )
        print("The acos of \(x) is \(ret) degrees")
        
        ret = asinf( Float(valX) )
        print("The asinf of \(x) is \(ret) degrees")
        
        ret = asin( Float(valX) )
        print("The asin of \(x) is \(ret) degrees")
        
        ret = atan2f( Float(valX) ,  Float(valY) )
        print("The atan2f of \(x) is \(ret) degrees")
        
        ret = atan2( Float(valX) ,  Float(valY) )
        print("The atan2f of \(x) is \(ret) degrees")
        
        ret = cosf( Float(valX) )
        print("The cos of \(x) is \(ret) degrees")
        
        ret = cos( Float(valX) )
        print("The cos of \(x) is \(ret) degrees")
        
        ret = sinf( Float(valX) )
        print("The sinf of \(x) is \(ret) degrees")
        
        ret = sin( Float(valX) )
        print("The sinf of \(x) is \(ret) degrees")
        
        ret = atanhf( Float(valX) )
        print("The atanhf of \(x) is \(ret) degrees")
        
        ret = atanh( Float(valX) )
        print("The atanhf of \(x) is \(ret) degrees")
        
        ret = coshf( Float(valX) )
        print("The coshf of \(x) is \(ret) degrees")
        
        ret = cosh( Float(valX) )
        print("The cosh of \(x) is \(ret) degrees")
        
        ret = sinhf( Float(valX) )
        print("The sinhf of \(x) is \(ret) degrees")
        
        ret = sinh( Float(valX) )
        print("The sinhf of \(x) is \(ret) degrees")
        
        ret = expm1f( Float(valX) )
        print("The expm1f of \(x) is \(ret) degrees")
        
        ret = expm1( Float(valX) )
        print("The expm1 of \(x) is \(ret) degrees")
        
        ret = logf( Float(valX) )
        print("The logf of \(x) is \(ret) degrees")
        
        ret = log( Float(valX) )
        print("The log of \(x) is \(ret) degrees")
        
        ret = log10f( Float(valX) )
        print("The log10f of \(x) is \(ret) degrees")
        
        ret = log10( Float(valX) )
        print("The log10 of \(x) is \(ret) degrees")
        
        ret = log2f( Float(valX) )
        print("The log2f of \(x) is \(ret) degrees")
        
        ret = log2( Float(valX) )
        print("The log2 of \(x) is \(ret) degrees")
        
        ret = log1pf( Float(valX) )
        print("The log1pf of \(x) is \(ret) degrees")
        
        ret = log1p( Float(valX) )
        print("The log1p of \(x) is \(ret) degrees")
        
        ret = logbf( Float(valX) )
        print("The logbf of \(x) is \(ret) degrees")
        
        ret = logb( Float(valX) )
        print("The logbf of \(x) is \(ret) degrees")
        
        ret = modff( Float(valX), &fVal)
        print("result of modff: \(ret)")
        
        var retD = modf(Double(valX), &dVal)
        print("result of modf: \(retD)")
        
        ret = frexpf(fVal, &iVal)
        print("result of frexpf: \(ret)")
        
        retD = frexp(dVal, &iVal)
        print("result of frexp: \(retD)")
        
        retD = Double(ilogbf(fVal))
        print("result of ilogbf: \(retD)")
        
        retD = Double(ilogb(fVal))
        print("result of ilogb: \(retD)")
        
        ret = scalbnf(fVal, iVal)
        print("result of ilogb: \(ret)")
        
        ret = Float(scalbln(dVal, Int(iVal)))
        print("result of scalbln: \(ret)")
        
        ret = fabsf(fVal)
        print("result of fabsf: \(ret)")
        
        ret = fabs(fVal)
        print("result of fabs: \(ret)")
        
        ret = cbrtf(fVal)
        print("result of cbrtf: \(ret)")
        
        retD = cbrt(dVal)
        print("result of cbrtf: \(retD)")
        
        ret = hypotf(343.34, 545.5454)
        print("result of hypotf: \(ret)")
        
        retD = hypot(343.34, 545.5454)
        print("result of hypot: \(retD)")
        
        ret = powf(34.34, 3.6)
        print("result of powf: \(ret)")
        
        retD = pow(34.34, 3.6)
        print("result of pow: \(retD)")
        
        ret = truncf(34.34)
        print("result of truncf: \(ret)")
        
        retD = trunc(34.34)
        print("result of trunc: \(retD)")
        
        ret = fmodf(34.34, 3.6)
        print("result of fmodf: \(ret)")
        
        retD = fmod(34.34, 3.6)
        print("result of fmod: \(retD)")
        
        ret = remainderf(34.34, 3.6)
        print("result of remainderf: \(ret)")
        
        retD = remainder(34.34, 3.6)
        print("result of remainder: \(retD)")
        
        ret = remquof(34.34, 3.6, &iVal)
        print("result of remquof: \(ret)")
        
        retD = remquo(34.34, 3.6, &iVal)
        print("result of remquo: \(retD)")
        
        ret = nextafterf(34.34, 3.6)
        print("result of nextafterf: \(ret)")
        
        retD = nextafter(34.34, 3.6)
        print("result of nextafter: \(retD)")
        
        ret = fdimf(34.34, 3.6)
        print("result of fdimf: \(ret)")
        
        retD = fdim(34.34, 3.6)
        print("result of fdim: \(retD)")
        
        ret = fminf(34.34, 3.6)
        print("result of fminf: \(ret)")
        
        retD = fmin(34.34, 3.6)
        print("result of fmin: \(retD)")
        
        ret = fmaf(34.34, 3.6, 2.3)
        print("result of fmaf: \(ret)")
        
        retD = fma(34.34, 3.6, 2.3)
        print("result of fma: \(retD)")
        
        result = sqrt(100)
        print("square root value of 100 is: \(result!)")
        
        result = fabs(50.988888)
        print("absolute value of 50.988888 is: \(result!)")
        
        result = __exp10(123.0)
        print("result of __exp10: \(result)")
        
        result = __exp10f(22.0)
        print("result of __exp10f: \(result)")
        
        result = __cospif(32.0)
        print("result of __cospif: \(result)")
        
        result = __cospi(111.0)
        print("result of __cospi: \(result)")

        result = __sinpif(22.0)
        print("result of __sinpif: \(result)")
        
        result = __sinpi(323.0)
        print("result of __sinpi: \(result)")
        
        result = __tanpif(33.0)
        print("result of __tanpif: \(result)")
        
        result = __tanpi(54.0)
        print("result of __tanpi: \(result)")
        
        result = __sincosf_stret(112.0)
        print("result of __sincosf_stret:\(result)")
        
        result = __sincos_stret(112.0)
        print("result of __sincos_stret:\(result)")
        
        result = __sincospif_stret(112.0)
        print("result of __sincospif_stret:\(result)")
        
        result = __sincospi_stret(112.0)
        print("result of __sincospi_stret:\(result)")
        
        let ptrF = ptrFromAddress(p: &fVal)
        let ptrD = ptrFromAddress(p: &dVal)
        
        result = __sincosf(32.0, ptrF, ptrF)
        print("result of __sincosf: \(result)")
        
        result = __sincos(434.0, ptrD, ptrD)
        print("result of __sincos: \(result)")
        
        result = __sincospif(44.0, ptrF, ptrF)
        print("result of __sincospif: \(result)")
        
        result = __sincospi(dVal, ptrD, ptrD)
        print("result of __sincospi: \(result)")
    }
    
    
    func  complexFunctions() {
        
        result = __fpclassifyf(433.87847)
        print("result of __fpclassifyf: \(result)")
        
        result = __fpclassifyd(434333.87847)
        print("result of __fpclassifyf: \(result)")
        
        result = __inline_isfinitef(433.87847)
        print("result of __inline_isfinitef: \(result)")
        
//                result = __builtin_fabsf(433.87847)
//                print("result of __builtin_fabsf: \(result)")
//        
//                result = __builtin_inff()
//                print("result of __builtin_inff: \(result)")
        
        result = __inline_isfinited(434433.87847)
        print("result of __inline_isfinited: \(result)")
        
//                result = __builtin_fabs(434433.87847)
//                print("result of __builtin_fabs: \(result)")
//        
//                result = __builtin_inf()
//                print("result of __builtin_inf: \(result)")
        
        result = __inline_isinff(433.87847)
        print("result of __inline_isinff: \(result)")
        
        result = __inline_isinfd(433.87847)
        print("result of __inline_isinfd: \(result)")
        
        result = __inline_isnand(433.87847)
        print("result of __inline_isinfd: \(result)")
        
        result = __inline_signbitf(433.87847)
        print("result of __inline_signbitf: \(result)")
        
        result = __inline_signbitd(433.87847)
        print("result of __inline_signbitd: \(result)")
                
        result = __inline_isnormalf(433.87847)
        print("result of __inline_isnormalf: \(result)")
                
        result = __inline_isnormald(433.87847)
        print("result of __inline_isnormald: \(result)")
        
    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }

}
