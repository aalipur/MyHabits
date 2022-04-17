//
//  HabitsTableViewCell.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 17.04.2022.
//

import UIKit

class HabitsTableViewCell: UITableViewCell {
    
    private let content: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel = UILabel(text: "Дышать", font: .sfProTextSemi17(), textColor: .specialPurple)
    private let periodLabel = UILabel(text: "Ежедневно", font: .sfProTextRegular17(), textColor: .specialGray)
    private let countLabel = UILabel(text: "Счетчик: 0", font: .sfProTextRegular17(), textColor: .specialGray)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContent()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContent() {
        contentView.addSubview(content)
        [nameLabel, periodLabel, countLabel].forEach { content.addSubview($0) }
    }
    
    private func setupConstraints() {
        let standartInset:CGFloat = 20
//        let topDownInset: CGFloat = 10
//        let heightOfLabel: CGFloat = 18
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: content.topAnchor, constant: standartInset),
            nameLabel.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: standartInset),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            nameLabel.widthAnchor.constraint(equalToConstant: 220),
            
            periodLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: standartInset),
            periodLabel.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: standartInset),
            periodLabel.heightAnchor.constraint(equalToConstant: 16),
            periodLabel.widthAnchor.constraint(equalToConstant: 117),
            
            countLabel.topAnchor.constraint(equalTo: periodLabel.topAnchor, constant: standartInset),
            countLabel.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: standartInset),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.widthAnchor.constraint(equalToConstant: 188),
        ])
    }
}
