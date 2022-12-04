//
//  ContentView.swift
//  IPTVFLX
//
//  Created by Adam Winick on 2022-11-27.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let val: Int = 47

    let tempTxt: String =
        """
        FINALLY GOT
        A VIEW TO RENDER ON THIS
        FUCKING TV
        FOR FUCK SAKES
        at age
        """
    
    let arr: [String] = ["Hello", "World", "SwiftUI"]
    
    let aSet = Set(["Hello", "World"])
    
    let aDict = [
        "first": "Adam Winick",
        "wife": "Sylvia Oliveira"
    ]
    
    // Only give dictionaries default values, if they are being evaluated, not
    // Just for the fuck of it in a single LOC.
        """;
    
    let failure = "failure"
    let success = "success"
    
    // Enums
    enum AEnum {
        case failure
        case success
    }
    
    /*
     enums can also store associated values attached to
     each case. This lets you attach additional
     information to your enums so they can represent more
     nuanced data.
     */
    
    enum AssociatedEnumExample {
        case bored
        case running(typeOfRunning: String)
        case gymrat(typeOfExercise: String)
    }
    
    // Now you can be specific when accessing Enum properites
    let WeightLifting = AssociatedEnumExample.gymrat(typeOfExercise: "Bench Press")
    
    var body: some View {
        Text(tempTxt + " \(val) \(arr[0]) \(arr[1]) \(aDict["wife", default: "YO"])")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
