//
//  MainVCPresenter.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//
import Foundation

protocol MainViewModelProtocol {
    var positions: [Position] { get }
}

class MainViewModel: MainViewModelProtocol {
    private let storage = Storage.shared
    private weak var view: MainViewController?
    
    var positions: [Position]
    
    init(view: MainViewController) {
        self.view = view
        self.positions = storage.positions
    }
}
