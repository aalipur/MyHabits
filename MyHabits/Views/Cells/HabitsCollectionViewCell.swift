//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 20.04.2022.
//

import UIKit

class HabitsCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel = UILabel(text: "", font: .sfProTextSemi17(), textColor: .specialPurple)
    private let periodLabel = UILabel(text: "", font: .sfProTextRegular17(), textColor: .specialGray)
    private let countLabel = UILabel(text: "Счетчик: 0", font: .sfProTextRegular17(), textColor: .specialGray)
    
    private let roundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 19
        view.layer.borderWidth = 2
        return view
    }()
    
    private let roundViewCheck: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 19
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        [nameLabel, periodLabel, countLabel, roundView].forEach { contentView.addSubview($0) }
    }
    
    func setupContentCell(index: IndexPath.Element) {
        let store = HabitsStore.shared
        nameLabel.text = store.habits[index].name
        nameLabel.textColor = store.habits[index].color
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let hourString = dateFormatter.string(from: store.habits[index].date)
        periodLabel.text = "Каждый день в \(hourString)"
        roundView.layer.borderColor = store.habits[index].color.cgColor
    }
}

//MARK: constraints
extension HabitsCollectionViewCell {
    private var standartInset: CGFloat { return 20}
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: standartInset),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartInset),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.widthAnchor.constraint(equalToConstant: 220),
            
            periodLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            periodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartInset),
            periodLabel.heightAnchor.constraint(equalToConstant: 16),
            periodLabel.widthAnchor.constraint(equalToConstant: 117),
            
            countLabel.topAnchor.constraint(equalTo: periodLabel.bottomAnchor, constant: 30),
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartInset),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.widthAnchor.constraint(equalToConstant: 188),
            
            roundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            roundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            roundView.heightAnchor.constraint(equalToConstant: 38),
            roundView.widthAnchor.constraint(equalToConstant: 38)
        ])
    }
}
