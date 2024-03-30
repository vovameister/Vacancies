//
//  Storage.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import Foundation

final class Storage {
    static let shared = Storage()
    private let service = Service()
    
    var positions: [Position] = []
    
    func fetchPositions(completion: @escaping ([Position]?, Error?) -> Void) {
        service.fetchPositions { (positions, error) in
            if let error = error {
                print("Error fetching positions: \(error)")
                completion(nil, error)
                return
            }
            if let positions = positions {
                self.positions = positions
                print(positions)
                completion(positions, nil)
            }
        }
    }
}
