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
    case failure
    case success
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

// Desctructure the return value of the above function
// You can skip values too

let (first, _) = returnTuple()
let (_, second) = returnTuple()
let noNamedParam = returnTupleB("No String", withVarName: "Param")
let isNumInRange: String = useRange(num: 120)
let loopedResults: String = loops()

// Only give dictionaries default values, if they are being evaluated, not
// Just for the fuck of it in a single LOC.
let TVText = Text(
    tempTxt +
        """
        \(val) \(arr[0]) \(arr[1]) \(aDict["wife", default: "YO"])
        \(AEnum.success) \(printString(str: "SHMEE")) \(isNumInRange)
        \(first) \(second) \(noNamedParam) \(ExportedString)
        \(loopedResults)
        """
    )
