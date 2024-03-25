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
        let detailsViewControllerPresenter = MoreDetailsViewControllerPresenter()
        detailsViewControllerPresenter.indexPath = indexPath
        detailsViewController.presenter = detailsViewControllerPresenter
        detailsViewControllerPresenter.view = detailsViewController
        viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
