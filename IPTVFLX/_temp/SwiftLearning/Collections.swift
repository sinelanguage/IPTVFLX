//
//  Arrays.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-12-21.
//

import Foundation

struct DepecheMode {
    var members = ["Dave", "Martin", "Fletch", "Alan"]
    var emptyArray = [String]()
    
    mutating func addVince() {
        members.append("Vince")
    }
}

struct DepecheModeDict {
    var members = [
        "lead": "Dave Gahan",
        "songwriter": "Martin Gore",
        "producer": "Alan Wilder",
        "claps": "Fletch"
    ]
    
    var emptyDect = [String: String]()
    
    func getLead() -> String {
        return members["lead"] ?? "Mr Gahan"
    }
}

struct DepecheModeSet {
    var members = Set([
        "dave",
        "martin",
        "fletch",
        "alan"
    ])
    
    var emptyMembers = Set<String>()
    
    func isDave() -> Bool{
        return members.contains("dave")
    }
    
    func numOfMembers() -> Int {
        return members.count
    }
}

struct DepecheModeEnums {
    enum Members {
        case dave
        case martin
        case fletch
        case alan
        case vince
    }
    
    func getMember() -> String {
        _ = Members.dave
        return "Dave"
    }
}
