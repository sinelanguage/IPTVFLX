//
//  Closures.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-18.
//

import Foundation


// Closures

func actionFn(str: String) -> String {
    return str
}

func actionFnVoid() -> Void {
    print("hello")
}

// assign a variable without a name
let driving = {
    actionFn(str: "Hello")
}

// call it like any other func
// driving()

// ==========================================

// Closures can accept parameters
// Notice the "in" keyword
let drivingWithParams = {
    (place: String) in
    actionFn(str: "Param Hello")
}

// Calling closures, you never use a parameter name, like this:
// drivingWithParams("London")

// ==========================================

// You can return values from closures in Swift
let drivingWithParamsAndReturn = {
    (place: String) -> String in
    return "driving with return values \(place)"
}

let useDrivingWithReturnValue = drivingWithParamsAndReturn("home")

// ==========================================

// Using Closures as parameters
// param name is a label and its type of the fn ( closure ) you will
// pass into it
func travel(action: () -> Void) {
    print("i am driving")
    action()
}

// Type for a closer that doesn't return any value appears to be "()"
// According to Swift's warning
// but now I changed it to "computed property" wtf?
let closureScope = {
    travel(action: actionFnVoid)
}

// ==========================================

// Trailing closure syntax, I'm fucking confused but we're told
// this syntax is used a lot in swift so get used to it

// Trailing closure syntax with a closure that accepts params
// instead of returning void like previous examples
// Closures that take params, and return values
func travelWithParamValue(action: (String) -> String) {
    print ("I am driving with params")
    let _ = action("Toronto") // use _ for unused variables, not sure why yet
    print("done")
}

let closureScopeB = {
    travelWithParamValue {
        (place: String) in
        actionFn(str: "\(place)")
    }
}

// ==========================================
// Shorthand (fp in JS)
let closureScopeC = {
    travelWithParamValue {
        place in "\(place)"
    }
}

// Closures that accept muliple params

func travelWithMultipleParams(action: (String, Int) -> String) -> String{
    let desc = action("Hello", 909)
    return desc
}

let closureScopeD = travelWithMultipleParams {
    "I'm going to \($0) and \($1)"
}

// Returning closures from functions
// This is similar to currying in JS

func returnClosureFromFunc() -> (String) -> (String) {
    return {
        let desc = "I'm going to \($0) var name could be anything"
        return desc
    }
}

let closureScopeE = returnClosureFromFunc()("Returned from closure from fn")
