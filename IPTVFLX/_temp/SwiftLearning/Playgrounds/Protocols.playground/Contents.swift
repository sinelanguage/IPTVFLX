import UIKit

var greeting = "Hello, playground"

// Protocols are contracts that let us define what kinds of functionality a data type is meant to support

// Protocols allow us to define props and methods we want to use but it doesn't implement them.  Its a blueprint that they must exist

// They are similar to Typescript Interfaces
// so far they are only dealing with methods

protocol Vehicle {
    func time(for distance: Int) -> Int
    func travel(distance: Int)
}
