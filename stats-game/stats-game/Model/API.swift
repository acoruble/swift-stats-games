//
//  apiManager.swift
//  stats-game
//
//  Created by anne-lise on 26/02/2020.
//  Copyright © 2020 anne-lise. All rights reserved.
//

import Foundation

class API {
    
    struct InfosPlayer : Decodable {
        var name: String
        var level: Int
        var levelIcon: String
        var prestige: Int
        var prestigeIcon: String
        var rating: Int
        var ratingIcon: String
    }
    
    func connectAPI(pseudo: String, battleTag: String) -> InfosPlayer {
        
        var infosPlayer: InfosPlayer!
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://ow-api.com/v1/stats/pc/eu/\(pseudo)-\(battleTag)/profile")!, timeoutInterval: Double.infinity)
        
        request.httpMethod = "Get"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let data = data
                else {
                    print(String(describing: error))
                    return
            }
            
            let jsonData = String(data:data,encoding: .utf8)!.data(using: .utf8)!
            print(jsonData)
            infosPlayer = try! JSONDecoder().decode(InfosPlayer.self,from: jsonData)
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return infosPlayer
    }
    
    
    
}


