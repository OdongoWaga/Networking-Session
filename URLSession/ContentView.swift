//
// Copyright iOS Mastery.
// All Rights Reserved.


import SwiftUI

struct ContentView: View {
    
    let vm = NetworkService()
    
    var body: some View {
        VStack {
            List(vm.characters) { character in
                CharacterRow(character: character)
            }
            
        }
        .onAppear {
            
            Task {
                           await vm.fetchCharacters()
                       }
          
        }
        
    }
}

#Preview {
    ContentView()
}
