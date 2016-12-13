//
//  FileC.swift
//  CFunction
//
//  Created by Shuvo on 12/5/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import Foundation

class FileC {
    
    var result:Any? = nil
    
    init() {
        
    }
    
    func swiftTest()  {
        print("\nFile Class\n")
        fileFunctions()
        
    }
    
    func fileFunctions() {
        
        
        var valI:Int = 1231
        let pvalI = ptrFromAddress(p: &valI)
        
        var val8:Int8 = 12
        let pVal8 = ptrFromAddress(p: &val8)
        
        var val82:Int8 = 8
        let p2Val8 = ptrFromAddress(p: &val82)
        
        let file = stdout
        result = clearerr(file)
        print("result of clearerr: \(file)")
        
        result = feof(file)
        print("result of feof: \(result)")
        
        result = ferror(file)
        print("result of ferror: \(result)")
        
        result = fflush(file)
        print("result of fflush: \(result)")
        
        result =  fgetc(file)
        print("result of fgetch: \(result)")
        
        result = fgets(pVal8, 32343, file)
        print("result of fgets: \(result)")
        
//        result = freopen(pVal8, p2Val8, file)
//        print("result of freopen: \(result)")
        
        result = fputc(5345, file)
        print("result of fputc: \(result)")

        result = fputs(pVal8, file)
        print("result of fputs: \(result)")
        
        result = fread(pVal8, 3, 2, file)
        print("result of fread: \(result)")
        
        result = fseek(file, 3, 34234)
        print("result of fseek: \(result)")
        
        result = ftell(file)
        print("result of ftell: \(result)")
        
        result = fwrite(pVal8, 3, 3, file)
        print("result of fwrite: \(result)")
        
        result = getc(file)
        print("result of getc: \(result)")
        
        print("result of getChar: \(getchar())")
        
        result = gets(pVal8)
        print("result of gets: \(result)")
        
        result = perror(pVal8)
        print("result of perror: \(result)")
        
        
        result = putc(34234, file)
        print("result of putc: \(result)")
        
        result = putchar(432)
        print("result of putchar: \(result)")
        
        result = puts(pVal8)
        print("result of puts: \(result)")
        
        result = remove(pVal8)
        print("result of remove: \(result)")
        
        result = rename(pVal8, p2Val8)
        print("result of rename: \(result)")
        
        result = rewind(file)
        print("result of rewind: \(result)")
        
        
//        result = setbuf(file, pVal8)
//        print("result of setbuf: \(result)")
        
        result = setvbuf(file, pVal8, 32112, 6)
        print("result of setvbuf: \(result)")
        
        result = tmpfile()
        print("result of tempfile: \(result)")
        
        result = ungetc(2134, file)
        print("result of ungetc: \(result)")
        
        let args: [CVarArg] = [ "foo", 12, 34.56 ]
        let listArgs = getVaList(args)
        var valUnsafeInt:Int8 = 21
        let ptrValUnsafe = ptrNotMutableFromAddress(p: &valUnsafeInt)
        
        result = vfprintf(file, ptrValUnsafe, listArgs)
        print("result of vfprintf: \(result)")
        
        result = vprintf(ptrValUnsafe, listArgs)
        print("result of vprintF: \(result)")
        
        result = ctermid(pVal8)
        print("result of ctermid: \(result)")
        
        result = fdopen(324, ptrValUnsafe)
        print("result of fdopen: \(result)")
        
        result =  fileno(file)
        print("result of fileno: \(result)")
        
        result = __srget(file)
        print("result of __srget: \(result)")
        
        result = __svfscanf(file, ptrValUnsafe, listArgs)
        print("result of __svfscanf: \(result)")
        
        result = __swbuf(32,file)
        print("result of __swbuf: \(result)")
        
        result = __sputc(454, file)
        print("result of __sputc: \(result)")
        
        result = flockfile(file)
        print("result of flockfile: \(result)")
        
        result = getc_unlocked(file)
        print("result of getc_unlocked: \(result)")
        
        print("result of getchar_unlocked: \(getchar_unlocked())")

        result = putc_unlocked(75847, file)
        print("result of putc_unlocked: \(result)")
        
        result = putchar_unlocked(5345)
        print("result of putchar_unlocked: \(result)")
        
        result = getw(file)
        print("result of getw: \(result)")
        
        result = putw(9889, file)
        print("result of putw: \(result)")
        
        result = fseeko(file, __darwin_off_t.max, 33)
        print("result of fseeko: \(result)")
        
        result = ftello(file)
        print("result of ftello: \(result)")
        
        result = vfscanf(file, ptrValUnsafe, listArgs)
        print("result of vfscanf: \(result)")
        
        result = vscanf(ptrValUnsafe, listArgs)
        print("result of vscanf: \(result)")
        
//        result = vsnprintf_l(pVal8, 2, copyfile_state_alloc() , ptrValUnsafe, listArgs)
//        print("result of vsnprintf_l : \(result)")
        
        result = vsscanf(pVal8, ptrValUnsafe, listArgs)
        print("result of vsscanf: \(result)")
        
        result = vdprintf(3232, ptrValUnsafe, listArgs)
        print("result of vdprintf: \(result)")
        
        result = ctermid_r(pVal8)
        print("result of ctermid_r: \(result)")
        
        result = fgetln(file, pvalI)
        print("result of fgetln: \(result)")
        
        result = fmtcheck(pVal8, p2Val8)
        print("result of fmtcheck: \(result)")
        
        result = fpurge(file)
        print("result of fpurge: \(result)")
        
        result = setbuffer(file, pVal8, 435)
        print("result of setbuffer: \(result)")
        
        result = setlinebuf(file)
        print("result of setlinebuf: \(result)")
        
//        result = zopen(pVal8, p2Val8, 423)
//        print("result of zopen; \(result)")
        
        
    }
    
    func ptrNotMutableFromAddress<T>(p:UnsafePointer<T>) -> UnsafePointer<T>
    {
        return p
    }

    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
