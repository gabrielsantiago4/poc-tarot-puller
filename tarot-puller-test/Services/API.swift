//
//  API.swift
//  tarot-puller-test
//
//  Created by Gabriel Santiago on 11/10/22.
//

import Foundation

struct ApiServices {
    
    static func getAllCards(completion: @escaping (CardList) ->()) {
        
        guard let url = URL(string: "https://rws-cards-api.herokuapp.com/api/v1/cards") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let responseData = data else {
                return
            }
            
            do{
                
                let cards = try JSONDecoder().decode(CardList.self, from: responseData)
                
//                print("ObjectCards: \(cards) ")
                completion(cards)
                
            }catch let error{
                
                print("error: \(error)")
            }
                
                
            
            
            // código usado para checar sucesso da requisicao
//            if let responseString = String(data: responseData, encoding: .utf8) {
//                print(responseString)
//            }
            	
        }
        
        task.resume()
        
    }
    
}
