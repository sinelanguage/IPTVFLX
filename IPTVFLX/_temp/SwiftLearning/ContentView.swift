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
    var body: some View {
        TVText
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
  
