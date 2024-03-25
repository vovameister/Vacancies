//
//  MoreDetailsViewController.swift
//  Vacancies
//
//  Created by Владимир Клевцов on 24.3.24..
//

import UIKit
import Kingfisher

class MoreDetailsViewController: UIViewController, MoreDetailsViewControllerProtocol {
    
    var presenter: MoreDetailsViewControllerPresenter!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let jobImageView = UIImageView()
    private let jobTitleLabel = UILabel()
    private let salaryLabel = UILabel()
    private let technologiesLabel = UILabel()
    private let jobDescriptionLabel = UILabel()
    private let companyDescriptionLabel = UILabel()
    private let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setUpConstraints()
        presenter.setDetails()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Position Details"
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        jobImageView.translatesAutoresizingMaskIntoConstraints = false
        jobImageView.contentMode = .scaleAspectFit
        
        jobTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        jobTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        jobTitleLabel.numberOfLines = 0
        
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
        salaryLabel.font = UIFont.systemFont(ofSize: 18)
        salaryLabel.textColor = .gray
        
        technologiesLabel.translatesAutoresizingMaskIntoConstraints = false
        technologiesLabel.font = UIFont.systemFont(ofSize: 18)
        technologiesLabel.numberOfLines = 0
        
        jobDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        jobDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        jobDescriptionLabel.numberOfLines = 0
        
        companyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        companyDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        companyDescriptionLabel.numberOfLines = 0
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setTitle("Share", for: .normal)
        shareButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(jobImageView)
        contentView.addSubview(jobTitleLabel)
        contentView.addSubview(salaryLabel)
        contentView.addSubview(technologiesLabel)
        contentView.addSubview(jobDescriptionLabel)
        contentView.addSubview(companyDescriptionLabel)
        contentView.addSubview(shareButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            jobImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            jobImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            jobImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            jobImageView.heightAnchor.constraint(equalToConstant: 200),
            
            jobTitleLabel.topAnchor.constraint(equalTo: jobImageView.bottomAnchor, constant: 16),
            jobTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            jobTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            salaryLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 8),
            salaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            salaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            technologiesLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 8),
            technologiesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            technologiesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            jobDescriptionLabel.topAnchor.constraint(equalTo: technologiesLabel.bottomAnchor, constant: 8),
            jobDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            jobDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            companyDescriptionLabel.topAnchor.constraint(equalTo: jobDescriptionLabel.bottomAnchor, constant: 8),
            companyDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            companyDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            shareButton.topAnchor.constraint(equalTo: companyDescriptionLabel.bottomAnchor, constant: 16),
            shareButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func displayPositionDetails(_ position: Position) {
        if let imageUrl = URL(string: position.image!) {
            jobImageView.kf.setImage(with: imageUrl)
        }
        jobTitleLabel.text = position.title
        salaryLabel.text = "Salary Level: \(position.salary)"
        technologiesLabel.text = "Technologies: \(position.technologies.joined(separator: ", "))"
        jobDescriptionLabel.text = "Job Description: \(position.jobDescription)"
        companyDescriptionLabel.text = "Company Description: \(position.companyDescription)"
    }
    
    @objc private func shareButtonTapped() {
        let shareText = "Check this position: \(jobTitleLabel.text ?? "")"
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}




