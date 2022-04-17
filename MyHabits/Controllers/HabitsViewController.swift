//
//  ViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 09.04.2022.
//
/*
 Создание проекта

 
 
 Добавьте класс HabitsStore.swift.
 Проверьте, что проект собирается без ошибок.
 Добавление базовой навигации

 Вёрстку самих экранов нужно будет сделать в следующих шагах.

 На экране HabitsViewController добавьте кнопку "Добавить" согласно макетам.
 Добавление экрана с информацией

 На экран InfoViewController добавить информацию о привычках согласно макетам. Если текст не влезает на экран, он должен скроллиться.

 Весь контент на экране должен скроллиться.


 */
import UIKit

class HabitsViewController: UIViewController {
    
//    private let navController: UINavigationController = {
//       let nav = UINavigationController()
//
//        return nav
//    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var progressSlider: UISlider = {
       let slider = UISlider()
        slider .translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.maximumTrackTintColor = .specialGray
        slider.minimumTrackTintColor = .specialPurple
        //slider.addTarget(self, action: #selector(progressSliderChange), for: .valueChanged)
        return slider
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HabitsTableViewCell.self, forCellReuseIdentifier: String.init(HabitsTableViewCell.identifier))
        table.rowHeight = UITableView.automaticDimension
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

//MARK: functions
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        [collectionView, progressSlider, tableView].forEach{ view.addSubview($0) }
    }
    //MARK: @objc functions
    @objc private func addHabit() {
        let habitVC = HabitViewController()
        let navContr = UINavigationController(rootViewController: habitVC)
        navContr.modalPresentationStyle = .fullScreen
        present(navContr,animated: true)
    }
}

//MARK: extension constraints
extension HabitsViewController {
    
    private func setupConstraints() {
        let leftRightInset:CGFloat = 12
        let collectionCellHeight: CGFloat = 80
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 162),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightInset),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightInset),
            collectionView.heightAnchor.constraint(equalToConstant: collectionCellHeight),
            
            progressSlider.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            progressSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightInset),
            progressSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightInset),
            
            tableView.topAnchor.constraint(equalTo: progressSlider.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightInset),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightInset),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

//MARK: extension UICollectionViewDataSource
extension HabitsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as? ProgressCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
//MARK: extension UITableViewDelegate
extension HabitsViewController: UICollectionViewDelegate {
    
    
}

//MARK: extension UITableViewDataSource
extension HabitsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitsTableViewCell.identifier, for: indexPath) as?
                HabitsTableViewCell else { return UITableViewCell() }
        return cell
    }
}

//MARK: extension UITableViewDelegate
extension HabitsViewController: UITableViewDelegate {
    
    
}
