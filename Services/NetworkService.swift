//
// Copyright iOS Mastery.
// All Rights Reserved.


import Foundation
import Combine


@Observable
class NetworkService{
    
//    var characters: [Character] = []
//    
//    func fetchCharacters(){
//        
//        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) {data, response, error in
//            
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            
//            guard let data = data else {
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedData = try decoder.decode(CharacterResponse.self, from: data)
//                self.characters = decodedData.results
//                
//                
//            } catch {
//                print(error.localizedDescription)
//            }
//            
//            
//        }
//        .resume()
//        
//    }
    
//    var subscriptions = Set<AnyCancellable>()
//
//    func fetchCharacters() {
//        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else{
//                    return
//                }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }  // Unwrap the data from the response
//            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main) // Switch to the main thread
//            .sink(receiveCompletion: { completion in
//                      switch completion {
//                      case .failure(let error):
//                          print(error.localizedDescription)
//                      case .finished:
//                          print("Data fetching finished")
//                      }
//                  }, receiveValue: { decodedData in
//                      self.characters = decodedData.results
//                  })
//            .store(in: &subscriptions)
//    }
    
    
    var characters: [Character] = []

    func fetchCharacters() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(CharacterResponse.self, from: data)
            self.characters = decodedData.results
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
