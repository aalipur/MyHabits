//
//  InfoView.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 16.04.2022.
//

import UIKit

class InfoView: UIView {
    
    private let mainLabel = UILabel(text: mainLabelText, font: .sfProDisplaySemi24(), textColor: .black)
    private let descriptionLabel = UILabel(text: descriptionLabelText, font: .sfProTextSemi17(), textColor: .black)
    
    private let textOne = UILabel(text: text1, font: .sfProTextRegular17(), textColor: .black)
    private let textTwo = UILabel(text: text2, font: .sfProTextRegular17(), textColor: .black)
    private let textThree = UILabel(text: text3, font: .sfProTextRegular17(), textColor: .black)
    private let textFour = UILabel(text: text4, font: .sfProTextRegular17(), textColor: .black)
    private let textFive = UILabel(text: text5, font: .sfProTextRegular17(), textColor: .black)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialLightGray
        setupTextLabel()
        [mainLabel, descriptionLabel,
         textOne, textTwo, textThree, textFour, textFive
        ].forEach{ addSubview($0) }
    }
    
    private func setupTextLabel() {
        descriptionLabel.numberOfLines = 3
        textOne.numberOfLines = 5
        textTwo.numberOfLines = 2
        textThree.numberOfLines = 4
        textFour.numberOfLines = 7
        textFive.numberOfLines = 5
    }
}

//MARK: constraints
extension InfoView {
    
    private func setupConstraints() {
        let sideInset: CGFloat = 16
        let upInset: CGFloat = 12
        let width: CGFloat = 343
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            mainLabel.heightAnchor.constraint(equalToConstant: 109),
            mainLabel.widthAnchor.constraint(equalToConstant: width),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: upInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 66),
            descriptionLabel.widthAnchor.constraint(equalToConstant: width),
            
            textOne.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: upInset),
            textOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            textOne.heightAnchor.constraint(equalToConstant: 109),
            textOne.widthAnchor.constraint(equalToConstant: width),
            
            textTwo.topAnchor.constraint(equalTo: textOne.bottomAnchor, constant: upInset),
            textTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            textTwo.heightAnchor.constraint(equalToConstant: 43),
            textTwo.widthAnchor.constraint(equalToConstant: width),
            
            textThree.topAnchor.constraint(equalTo: textTwo.bottomAnchor, constant: upInset),
            textThree.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            textThree.heightAnchor.constraint(equalToConstant: 89),
            textThree.widthAnchor.constraint(equalToConstant: width),
            
            textFour.topAnchor.constraint(equalTo: textThree.bottomAnchor, constant: upInset),
            textFour.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            textFour.heightAnchor.constraint(equalToConstant: 155),
            textFour.widthAnchor.constraint(equalToConstant: width),
            
            textFive.topAnchor.constraint(equalTo: textFour.bottomAnchor, constant: upInset),
            textFive.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideInset),
            textFive.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textFive.heightAnchor.constraint(equalToConstant: 110),
            textFive.widthAnchor.constraint(equalToConstant: width),
        ])
    }
}
