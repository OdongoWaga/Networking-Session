//
// Copyright iOS Mastery.
// All Rights Reserved.


import SwiftUI
import SwiftData

@main
struct URLSessionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: CharacterModel.self)
                
                
        }
    }
}
