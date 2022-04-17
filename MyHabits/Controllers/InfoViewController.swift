//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 09.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let infoView = InfoView()
    private let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
//MARK: functions
        private func setupViews() {
            view.backgroundColor = .specialLightGray
            navigationController?.navigationBar.tintColor = .specialBackgroundTabBar
            navigationItem.title = "Информация"
            view.addSubview(scrollView)
            scrollView.addSubview(infoView)
        }
}

extension InfoViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            infoView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            infoView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
