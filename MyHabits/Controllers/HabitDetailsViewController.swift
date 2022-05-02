//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 17.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    private let activLabel = UILabel(text: "АКТИВНОСТЬ", font: .sfProTextRegular13(), textColor: .systemGray)
    let store = HabitsStore.shared
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
        setupDelegates()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        [activLabel, tableView].forEach{ view.addSubview($0) }
    }
    
    private func setupNavigation() {
        navigationItem.title = "Сделать зарядку"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Сегодня", style: .done, target: self, action: #selector(dismissAction))
        navigationItem.leftBarButtonItem?.tintColor = .specialPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem?.tintColor = .specialPurple
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: @objc functions
    @objc private func dismissAction() {
        dismiss(animated: true)
    }

    @objc private func editAction() {
         let habitEditVC = HabitEditViewController()
         let navContr = UINavigationController(rootViewController: habitEditVC)
         navContr.modalPresentationStyle = .fullScreen
         present(navContr,animated: true)
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
            activLabel.widthAnchor.constraint(equalToConstant: 343),
            
            tableView.topAnchor.constraint(equalTo: activLabel.bottomAnchor, constant: 6.5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //tableView.heightAnchor.constraint(equalToConstant: 172)
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
//MARK: extension UITableViewDataSource
extension HabitDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let store = HabitsStore.shared
        return store.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var content = cell.defaultContentConfiguration()
        let store = HabitsStore.shared
        content.text = store.trackDateString(forIndex: indexPath.row)
        cell.contentConfiguration = content
        cell.backgroundColor = .white
        cell.tintColor = store.habits[indexPath.row].color
        cell.accessoryType = .checkmark
        return cell
    }
}

//MARK: extension UITableViewDelegate
extension HabitDetailsViewController: UITableViewDelegate {
    
    
}
