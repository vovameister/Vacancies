//
//  MainVCPresenter.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//
import Foundation

protocol MainViewModelProtocol {
    var positions: [MainPosition]? { get }
}

class MainViewModel: MainViewModelProtocol {
    private let storage = Storage.shared
    private weak var view: ViewController?
    
    var positions: [MainPosition]?
    
    init(view: ViewController) {
        self.view = view
        updatePositions()
    }
    
    private func updatePositions() {
        self.positions = storage.positions.map { Position in
            return MainPosition(image: Position.image, title: Position.title, salary: Position.salary)
        }
    }
}
