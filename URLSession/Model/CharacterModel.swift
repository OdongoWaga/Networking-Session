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




