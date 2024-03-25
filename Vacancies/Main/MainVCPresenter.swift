//
//  MainVCPresenter.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//
import Foundation


class PositionPresenter {
    private let storage = Storage.shared
    
    private weak var view: ViewController?
    private var positions: [MainPosition] = []
    
    var numberOfPositions: Int {
        return positions.count
    }
    
    init(view: ViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        positions = storage.positions.map { Position in
                    return MainPosition(image: Position.image, title: Position.title, salary: Position.salary)
                }
        view?.tableView.reloadData()
    }
    
    func position(at index: Int) -> MainPosition {
        return positions[index]
    }
}
