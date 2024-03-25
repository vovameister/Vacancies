//
//  ViewController.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//
import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let titleLabel = UILabel()
    var presenter: PositionPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = PositionPresenter(view: self)
        
        setUpView()
        setUpConstraint()
        
        presenter.viewDidLoad()
    }
    
    func setUpView() {
        view.backgroundColor = .purple
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCellMain.self, forCellReuseIdentifier: "MainCell")
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .none
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.text = "Vacancies:"
        titleLabel.textAlignment = .center
        
        view.addSubview(tableView)
        view.addSubview(titleLabel)
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPositions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! TableViewCellMain
        
        let position = presenter.position(at: indexPath.row)
        
        if let imageUrl = URL(string: position.image ?? "") {
            cell.jobImageView.kf.setImage(with: imageUrl)
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: position.title, subtitle: position.salary)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.navigateToMoreDetailsViewController(from: self, with: indexPath)
    }
}