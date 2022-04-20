//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 17.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private let activLabel = UILabel(text: "АКТИВНОСТЬ", font: .sfProTextRegular13(), textColor: .systemGray)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        [activLabel].forEach{ view.addSubview($0) }
    }
    
    private func setupNavigation() {
        //navigationItem.title = "Сделать зарядку"
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Сегодня", style: .done, target: self, action: #selector(dismissAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editAction))
    }
    
    //MARK: @objc functions
    @objc private func dismissAction() {
        dismiss(animated: true)
    }

    @objc private func editAction() {
        print("saveTapped")
    }
}

//MARK: extension constraints
extension HabitDetailsViewController {
    
    private func setupConstraints() {
        let sideInset:CGFloat = 16
        NSLayoutConstraint.activate([
            activLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            activLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideInset),
            activLabel.heightAnchor.constraint(equalToConstant: 18),
            activLabel.widthAnchor.constraint(equalToConstant: 343)
        ])
    }
}

