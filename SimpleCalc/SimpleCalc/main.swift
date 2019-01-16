//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let simpleOperators = ["+", "-", "*", "/", "%"]
        if args.count == 3 && simpleOperators.contains(args[1]) { //simple operations
            let opt = args[1]
            let a1 = Int(args[0])!
            let a2 = Int(args[2])!
            switch opt {
            case "+":
                return a1 + a2
            case "-":
                return a1 - a2
            case "*":
                return a1 * a2
            case "/":
                return a1 / a2
            case "%":
                return a1 % a2
            default:
                return -1
            }
        } else { 
            return complexOp(args)
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

private func complexOp(_ args: [String]) -> Int{
    let len = args.count
    if len == 1 {
        return 0
    }
    let opt = args.last
    switch opt {
    case "count":
        return (len - 1)
        
    case "avg":
        var num = 0
        for i in 0..<(len - 1)  {
            num = num + Int(args[i])!
        }
        return num / (len - 1)
        
    case "fact":
        let num = Int(args[0])!
        if num == 0 {
            return 1
        }
        var result = 1
        for i in 1...num {
            result = result * i
        }
        return result
    default:
        return -1
    }
}


print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

