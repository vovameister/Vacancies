//
//  MoreDatailsPresenter.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import Foundation

class MoreDetailsViewControllerViewModel {
    weak var view: MoreDetailsViewControllerProtocol?
    private var storage = Storage.shared
    
    var indexPath: IndexPath?
    var positions: [Position]? {
        didSet {
            setDetails()
        }
    }
    
    
    func setDetails() {
        if let indexPath = indexPath, let position = positions?[indexPath.row] {
            view?.displayPositionDetails(position)
        }
    }
}
