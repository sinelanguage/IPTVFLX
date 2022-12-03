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

    let tempTxt = "FINALLY GOT A VIEW TO RENDER ON THIS FUCKING TV FOR FUCK SAKES";
    
    var body: some View {
        Text(tempTxt)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
