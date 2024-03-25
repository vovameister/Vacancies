//
//  PositionModel.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import Foundation

struct Position: Codable {
    var image: String?
    var title: String
    var salary: String
    var technologies: [String]
    var jobDescription: String
    var companyDescription: String
}


