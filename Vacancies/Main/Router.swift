//
//  Router.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import UIKit

class Router {
    
    static var topMostViewController: UIViewController? {
        var topController: UIViewController?
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            topController = windowScene.windows.first?.rootViewController
            while let presentedViewController = topController?.presentedViewController {
                topController = presentedViewController
            }
        }
        
        return topController
    }
    
    func navigateToMoreDetailsViewController(position: Position) {
        let detailsViewController = MoreDetailsViewController()
        let detailsViewModel = MoreDetailsViewControllerViewModel(position: position)
        
        if let navigationController = Router.topMostViewController?.navigationController {
            navigationController.pushViewController(detailsViewController, animated: true)
        } else {
            print("No navigation controller found")
        }
    }
}


