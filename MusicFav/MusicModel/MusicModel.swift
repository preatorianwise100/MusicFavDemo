//
//  MusicModel.swift
//  MusicFav
//
//  Created by Jose David Bustos H on 11/8/19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit
import Foundation
class MusicModel {

    let stubDataURL = "https://itunes.apple.com/search?term=in+utero&mediaType=music&limit=20"
    
    func getContext(completion: @escaping (_ contexts: Music?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createContextObjectWithMusic(json: data, completion: { (contexts, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(contexts, nil)
            })
        }
    }
}

extension MusicModel {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: No se puede crear URL de string")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let postString = "{}"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error llamando api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data es nulo")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createContextObjectWithMusic(json: Data, completion: @escaping (_ data: Music?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let contexts = try decoder.decode(Music.self, from: json)
            return completion(contexts, nil)
        } catch let error {
            print("Ocurrio un error creando JSON: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}

