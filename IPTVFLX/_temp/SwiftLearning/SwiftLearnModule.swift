//
//  swiftLearn.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-07.
//

import Foundation
import SwiftUI

let arr: [String] = ["Hello", "World", "SwiftUI"]
let val: Int = 47

let tempTxt: String =
    """
    FINALLY GOT
    A VIEW TO RENDER ON THIS
    FUCKING TV
    FOR FUCK SAKES
    at age
    """


let aSet = Set(["Hello", "World"])

let aDict = [
    "first": "Adam Winick",
    "wife": "Sylvia Oliveira"
]

// Initial empty collections (complex types)
let emptyArr = [String]()
let emptyDict = [String: Int]()
let emptySet = Set<String>()

// Enums
enum AEnum {
    // WTF Enums default to strings?
    // Nope, according to docs, values are hashable by default
    // which is why its not saying "failure" or "success" are undefined
    case failure
    case success
}

// Error is built in type
enum DemoError: Error {
    case passwordIncorrect
    case usernameIncorrect
}

/*
 Enums can also store associated values attached to
 each case. This lets you attach additional
 information to your enums so they can represent more
 nuanced data.
 */

enum AssociatedEnumExample {
    case bored
    case running(typeOfRunning: String)
    case gymrat(typeOfExercise: String)
}


// Enum raw values initiated after
// Now you can be specific when accessing Enum properites
let WeightLifting = AssociatedEnumExample.gymrat(typeOfExercise: "Bench Press")

// Loops

func loops() -> String {
    let num = 1...5
    var digit: Int = 0
    var str: String =
    """
    """

    for i in num {
        digit = i
        str +=
        """
        val \(i) \(digit).
        """
        
        repeat {
            str +=
            """
            digit \(digit),
            """
            if (digit == 4) {
                str +=
                """
                will break here,
                """
                break
            }
            digit += 1
        } while digit < 5
    }
    

    
    return str
}


func useRange(num: Int) -> String {
    switch num {
    case 0...50:
        return "low range"
    case 51...100:
        return "hi range"
    default:
        return "out of range"
    }
}

// Functions
func printString(str: String) -> String {
    return str
}

// Return type could be a Tuple
func returnTuple() -> (first: String, second: String) {
    return (first: "hello", second: "world")
}

func returnTupleB(_ noVarName: String, withVarName: String) -> String {
    return (noVarName + " " + withVarName)
}

// Swift lets you provide labels for variable names like using Objects as args in JS functions

func namedLabels(num: Int, str: String) -> (Int, String) {
    return (num: num, str: str)
}

// func arg has two names, 1 for caller to pass in param and 1 for func body

func doubleNamedLabels(str name: String) -> String {
    return name // using name in the body but str in the call down below
}

func omitNamedLabels(_ name: String) -> String {
    return name // notice at the call sight, that "name" is not labelled in func args
}

func defaultParamVals(name: String = "Adam") -> String {
    return name
}

func variodicFuncParams(nums: Int...) -> Int {
    doubleForEveryone(num: &myNum)
    var total = 0
    for num in nums {
        total += num
    }
    return total
}

// Errors = enum of error types + throw fn
enum UsernameError: Error {
    case alreadyUsed
    case notEnoughChar
}

func checkUsername(username: String) throws -> Void {
    if username.count < 10 {
        throw UsernameError.notEnoughChar
    }
}

func handleUsername(username: String) -> String {
    if username.count > 0 {
        do {
            try checkUsername(username: username)
        } catch {
            return "Error found \(username.count)"
        }
    }
    return "Username is valid \(username.count)"
}

// inout allows you to modify the value of parameters from inside a closure, to its value outside,
// preface "inout" before the <type>
// preface the parameter value with "&"<varName>  so:  funcName(number: &nyNum)
var myNum = 15

func doubleForEveryone(num: inout Int) -> Void {
    num *= 4
}

// Desctructure the return value of the above function
// You can skip values too

let (first, _) = returnTuple()
let (_, second) = returnTuple()
let noNamedParam = returnTupleB("No String", withVarName: "Param")
let isNumInRange: String = useRange(num: 120)
let loopedResults: String = loops()
let useNamedLabels: (Int, String) = namedLabels(num: 10, str: "Ten")
let useOmitNamedLabels: String = omitNamedLabels("Label is omitted")
let useDefaultParamVals: String = defaultParamVals()
let variodicFuncResult: Int = variodicFuncParams(nums: 3,6,9,12)
let username: String = handleUsername(username: "Shit")



// Only give dictionaries default values, if they are being evaluated, not
// Just for the fuck of it in a single LOC.
let TVText = Text(
    tempTxt +
        """
        \(val) \(arr[0]) \(arr[1]) \(aDict["wife", default: "YO"])
        \(AEnum.success) \(printString(str: "SHMEE")) \(isNumInRange)
        \(first) \(second) \(noNamedParam) \(ExportedString)
        \(loopedResults) \(useNamedLabels)
        \(doubleNamedLabels(str: "Double Named Arg"))
        \(useOmitNamedLabels)
        \(useDefaultParamVals)
        \(variodicFuncResult)
        \(username) \(myNum)
        \(String(describing: closureScopeD))
        \(closureScopeE)
        """
    )
