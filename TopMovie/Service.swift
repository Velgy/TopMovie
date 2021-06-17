//
//  Service.swift
//  TopMovie
//
//  Created by Valentin on 16.06.2021.
//

import UIKit

class Service {
    
    let decoder = JSONDecoder()
    
    func requestApi(completion: @escaping (Response) -> Void) {
        
        let baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=5047e705194dbcecff62bca4e5b3aaac"
        
        if let url = URL(string: baseUrl) {
            URLSession.shared.dataTask(with: url) { data, responce, error in
                if let data = data {
                    do {
                        let object = try self.decoder.decode(Response.self, from: data)
                        DispatchQueue.main.async {
                            completion(object)
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

