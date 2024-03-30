//
//  LoadingScreenViewController.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 25.3.24..
//

import UIKit

final class LoadingScreenViewController: UIViewController {
    private let titleLabel = UILabel()
    
    private let storage = Storage.shared
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemYellow
        setUpTitle()
        loadStorage()
    }
    
    func setUpTitle() {
        titleLabel.text = "Loading..."
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func loadStorage() {
        storage.fetchPositions { (positions, error) in
            if let error = error {
                print(error)
                return
            }
            if positions != nil {
                DispatchQueue.main.async {
                    let controller = MainViewController()
                    let navigationController = UINavigationController(rootViewController: controller)
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = navigationController
                    
                }
            }
        }
    }
}
