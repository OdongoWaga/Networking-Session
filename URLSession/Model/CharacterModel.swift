//
// Copyright iOS Mastery.
// All Rights Reserved.


import Foundation
import SwiftData
import UIKit


struct CharacterResponse: Decodable {
    let results:[Character]
    
}


struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: URL
   
}


@Model
class CharacterModel {
    var id: Int
    var name: String
    var imageUrl: String
//    @Attribute(.externalStorage)
//    var image: Data?
    
    init(id: Int, name: String, imageUrl: String,
         //image: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
       // self.image = image
    }
}

extension CharacterModel {
    
    
    
    @ModelActor
    actor BackgroundActor {
        
        func importCharacters() async throws {
            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
                
                let characters = try JSONDecoder().decode(CharacterResponse.self, from: data)
                
                for character in characters.results {
                    
                    let characterModel = CharacterModel(id: character.id, name: character.name, imageUrl: character.image.absoluteString)
                    
                    modelContext.insert(characterModel)
                }
                
                try modelContext.save()
            } catch  {
                throw error
            }

            
        }
    }
}

