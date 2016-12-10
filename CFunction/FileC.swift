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
        
        result = fputc(5345, file)
        print("result of fputc: \(result)")
        
        result = fputs(pVal8, file)
        print("result of fputs: \(result)")
        
        let ptr = malloc(5)
        result = fread(ptr, 3, 2, file)
        print("result of fread; \(result)")
        
        result = freopen(pVal8, pVal8, file)
        print("result of freopen: \(result)")
        
        result = fseek(file, 3, 34234)
        print("result of fseek; \(result)")
        
        result = fwrite(ptr, 3, 3, file)
        print("result of ftell: \(result)")
        
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
        
        result = rename(pVal8, p2Val8)
        print("result of rename: \(result)")
        
        result = rewind(file)
        print("result of rewind: \(result)")
        
        result = setbuf(file, pVal8)
        print("result of setbuf: \(result)")
        
        result = setvbuf(file, pVal8, 32112, 6)
        print("result of setvbuf: \(result)")
        
        result = tmpfile()
        print("result of tempfile: \(result)")
        
        result = ungetc(2134, file)
        print("result of ungetc: \(result)")
        
        result = flockfile(file)
        print("result of flockfile: \(result)")
        
        result = ftrylockfile(file)
        print("result of ftrylockfile: \(result)")
        
        result = funlockfile(file)
        print("result of funlockfile: \(result)")
        
        result = getc_unlocked(file)
        print("result of getc_unclocked: \(result)")
        
        print("result of getchar_unlocked: \(getchar_unlocked())")
        
        result = putc_unlocked(75847, file)
        print("result of putc_unlocked: \(result)")
        
        result = getw(file)
        print("result of getw: \(result)")
        
        result = putw(9889, file)
        print("result of putw: \(result)")
        
        let x:Int32 = 43222
        result = ungetc(x, file)
        print("result of ungetc: \(result)")
        
        result = fdopen(x, pVal8)
        print("result of fdopen: \(result)")
        
        result =  fileno(file)
        print("result of fileno: \(result)")
        
        result = ctermid(pVal8)
        print("result of ctermid: \(result)")
        
        result = fgetln(file, pvalI)
        print("result of fgetln: \(result)")
        
        result = fmtcheck(pVal8, p2Val8)
        print("result of fmtcheck: \(result)")
        
        result = fpurge(file)
        print("result of fpurge: \(result)")
        
        result = setbuf(file, pVal8)
        print("result of setbug: \(result)")
        
        result = setbuffer(file, pVal8, x)
        print("result of setbuffer: \(result)")
        
        result = setlinebuf(file)
        print("result of setlinebuf: \(result)")
        
//        result = zopen(pVal8, p2Val8, x)
//        print("result of zopen; \(result)")
        
        result = remove(pVal8)
        print("result of remove: \(result)")
        
        result = fclose(file)
        print("result of fclose: \(result)")
        

    }
    
    func ptrFromAddress<T>(p:UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T>
    {
        return p
    }
}
