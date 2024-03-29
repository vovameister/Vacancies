//
//  Router.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import UIKit

class Router {
    static func navigateToMoreDetailsViewController(from viewController: UIViewController, with indexPath: IndexPath) {
        let detailsViewController = MoreDetailsViewController()
        let detailsViewModel = MoreDetailsViewControllerViewModel()
        detailsViewModel.indexPath = indexPath
        detailsViewModel.view = detailsViewController
        viewController.navigationController?.pushViewController(detailsViewController, animated: true)
        detailsViewModel.positions = Storage.shared.positions
    }
}
