//
//  ProgressBarView.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 20.04.2022.
//

import UIKit

class ProgressBarView: UIView {
    
    private let mainLabel = UILabel(text: "Все получится!", font:.sfProTextSemi13(), textColor: .systemGray)
    private let percentLabel = UILabel(text: "50%", font:.sfProTextSemi13(), textColor: .systemGray)
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .specialLightGray
        progressView.progressTintColor = .specialPurple
        return progressView
    }()

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
        backgroundColor = .white
        layer.cornerRadius = 8
        let store = HabitsStore.shared
        let progress = store.todayProgress
        percentLabel.text = "\(Int(progress))%"
        progressView.setProgress(progress, animated: true)
        [mainLabel, percentLabel, progressView].forEach{ addSubview($0) }
    }
}

//MARK: constraints
extension ProgressBarView {
    
    private func setupConstraints() {
        let leftRightInset: CGFloat = 12
        let topDownInset: CGFloat = 10
        let heightOfLabel: CGFloat = 18 
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: topDownInset),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leftRightInset),
            mainLabel.heightAnchor.constraint(equalToConstant: heightOfLabel),
            mainLabel.widthAnchor.constraint(equalToConstant: 216),
            
            percentLabel.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leftRightInset),
            
            progressView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: topDownInset),
            progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leftRightInset),
            progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leftRightInset),
            progressView.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
}
