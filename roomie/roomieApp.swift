//
//  roomieApp.swift
//  roomie
//
//  Created by Jack Oehling on 3/30/25.
//

import SwiftUI
import Firebase


@main
struct roomieApp: App {
    @StateObject var dataManager = DataManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataManager)
        }
    }
}
