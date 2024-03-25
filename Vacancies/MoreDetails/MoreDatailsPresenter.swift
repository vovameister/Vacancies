//
//  MoreDatailsPresenter.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import Foundation

protocol MoreDetailsViewControllerProtocol: AnyObject {
    func displayPositionDetails(_ position: Position)
}
class MoreDetailsViewControllerPresenter {
    weak var view: MoreDetailsViewControllerProtocol?
    private var storage = Storage.shared
    
    var indexPath: IndexPath?
    var positions: [Position]? {
        return storage.positions
    }
    
    
    func setDetails() {
        if let indexPath = indexPath, let position = positions?[indexPath.row] {
            view?.displayPositionDetails(position)
        }
    }
}
