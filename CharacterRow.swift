//
// Copyright iOS Mastery.
// All Rights Reserved.


import SwiftUI

struct CharacterRow: View {
    
    var character: CharacterModel
    var body: some View {
        
        HStack{
//            AsyncImage(url: character.image) { image in
//                
//                image
//                    .resizable()
//                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//                    .frame(width: 100, height: 100)
//            } placeholder: {
//                ProgressView()
//            }
            
            Image(uiImage: character.viewImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                 .frame(width: 100, height: 100)
               
            
            
            Text(character.name)
        }
    }
}


