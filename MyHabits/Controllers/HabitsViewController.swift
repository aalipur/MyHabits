//
//  ViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 09.04.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private let array: [Int] = {
       var arr = [Int]()
        for i in 0...30 {
            arr.append(i)
        }
        return arr
    }()
    
    private let progressView = ProgressBarView()
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .specialLightGray
        collectionView.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: HabitsCollectionViewCell.identifier)
        return collectionView
    }()
    //MARK: ViewcCntroller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }

    //MARK: functions
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem?.tintColor = .specialPurple
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        [progressView, collectionView].forEach{ view.addSubview($0) }
    }
    
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func reloadData() {
        collectionView.reloadData()
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
        let leftRightInset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 162),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightInset),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightInset),
            progressView.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 18),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightInset),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightInset),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: extension UICollectionViewDataSource
extension HabitsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsCollectionViewCell.identifier, for: indexPath) as? HabitsCollectionViewCell else { return UICollectionViewCell() }
        //cell.HabitsStore.shared.habits[indexPath]
        cell.setupContentCell(index: indexPath.row)
        return cell
    }
}

//MARK: extension UITableViewDelegate
extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    private var collectionViewCellHeight: CGFloat { return 130 }
    private var lineSpacingForSection: CGFloat { return 12 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        lineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let habitDetailVC = HabitDetailsViewController()
        let navContr = UINavigationController(rootViewController: habitDetailVC)
        navContr.modalPresentationStyle = .fullScreen
        present(navContr,animated: true)
//        habitDetailVC.title = "wefv"
//        habitDetailVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "sddcs", style: .done, target: self, action: nil)
//        navigationController?.navigationBar.tintColor = .specialPurple
//        navigationController?.pushViewController(habitDetailVC, animated: true)
    }
}
