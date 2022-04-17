//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 17.04.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let mainLabel = UILabel(text: "Все получится!", font:.sfProTextSemi13(), textColor: .systemGray)
    private let percentLabel = UILabel(text: "50%", font:.sfProTextSemi13(), textColor: .systemGray)
    
    private lazy var progressSlider: UISlider = {
       let slider = UISlider()
        slider .translatesAutoresizingMaskIntoConstraints = false
        slider.thumbTintColor = .clear
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.maximumTrackTintColor = .specialGray
        slider.minimumTrackTintColor = .specialPurple
        slider.addTarget(self, action: #selector(progressSliderChange), for: .valueChanged)
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: functions
    private func setupCell() {
        contentView.backgroundColor = .white
        [mainLabel, percentLabel, progressSlider].forEach{ contentView.addSubview($0) }
    }
    
    @objc private func progressSliderChange() {
        //percentLabel.text = "\(Int(progressSlider.value))"
    }
    private func setupConstraints() {
        let leftRightInset:CGFloat = 12
        let topDownInset: CGFloat = 10
        let heightOfLabel: CGFloat = 18
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topDownInset),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftRightInset),
            mainLabel.heightAnchor.constraint(equalToConstant: heightOfLabel),
            //mainLabel.widthAnchor.constraint(equalToConstant: 216),
            
            percentLabel.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            //percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topDownInset),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -leftRightInset),
            //percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //percentLabel.widthAnchor.constraint(equalToConstant: 95),
            
            progressSlider.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: topDownInset),
            progressSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftRightInset),
            progressSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -leftRightInset),
        ])
    }
}
