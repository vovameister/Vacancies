//
//  Service.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import Foundation

final class Service {
    func fetchPositions(completion: @escaping ([Position]?, Error?) -> Void) {
        let urlString = "https://75fedc4afc8f45249a27302b8477f824.api.mockbin.io/"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data available"]))
                return
            }
            do {
                let positions = try JSONDecoder().decode([Position].self, from: data)
                completion(positions, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
