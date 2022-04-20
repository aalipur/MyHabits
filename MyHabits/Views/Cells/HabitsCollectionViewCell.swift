//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 20.04.2022.
//

import UIKit

class HabitsCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel = UILabel(text: "Дышать", font: .sfProTextSemi17(), textColor: .specialPurple)
    private let periodLabel = UILabel(text: "Ежедневно", font: .sfProTextRegular17(), textColor: .specialGray)
    private let countLabel = UILabel(text: "Счетчик: 0", font: .sfProTextRegular17(), textColor: .specialGray)
    
    
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
        [nameLabel, periodLabel, countLabel].forEach { contentView.addSubview($0) }
    }
}

//MARK: constraints
extension HabitsCollectionViewCell {
    private var standartInset: CGFloat { return 20}
//        let topDownInset: CGFloat = 10
//        let heightOfLabel: CGFloat = 18
    
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
        ])
    }
}
