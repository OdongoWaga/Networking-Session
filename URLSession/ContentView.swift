//
// Copyright iOS Mastery.
// All Rights Reserved.


import SwiftUI
import SwiftData

struct ContentView: View {
    
   // let vm = NetworkService()
    @Environment(\.modelContext) private var modelContext
    @Query private var characters: [CharacterModel]
    
    var body: some View {
        VStack {
            List(characters) { character in
                CharacterRow(character: character)
            }
            
        }
        .task(priority: .userInitiated) {
            
            let container = modelContext.container
            let bgActor = CharacterModel.BackgroundActor(modelContainer: container)
            
            do {
                try await bgActor.importCharacters()
            
                
            } catch {
                print("Error importing characters: \(error)")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
