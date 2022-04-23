//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 16.04.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    private let nameLabel = UILabel(text: "НАЗВАНИЕ", font: .sfProTextSemi13(), textColor: .black)
    
    private let nameTextfield: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        
        return textField
    }()
    
    private let colorLabel = UILabel(text: "ЦВЕТ", font: .sfProTextSemi13(), textColor: .black)
    
    private lazy var colorButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .orange
            button.layer.cornerRadius = 15
            button.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
            return button
        }()
    
    private let scheduleLabel = UILabel(text: "Каждый день в", font: .sfProTextSemi13(), textColor: .black)
    
    private lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = .specialGreen
        datePicker.addTarget(self, action: #selector(datePickerAction), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var removeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(UIColor.specialRed, for: .normal)
        button.titleLabel?.font = .sfProTextSemi17()
        button.addTarget(self, action: #selector(removeAction), for: .touchUpInside)
        return button
    }()

    //MARK: ViewcCntroller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
    }
 
    //MARK: functions
    private func setupViews() {
        view.backgroundColor = .specialLightGray
        self.hideKeyboard()
        [nameLabel, nameTextfield, colorLabel, colorButton, scheduleLabel, datePicker, removeButton].forEach{ view.addSubview($0) }
    }
    
    private func setupNavigation() {
        navigationItem.title = "Создать"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(dismissAction))
        navigationItem.leftBarButtonItem?.tintColor = .specialPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Создать", style: .done, target: self, action: #selector(saveAction))
        navigationItem.rightBarButtonItem?.tintColor = .specialPurple
    }
    
    private func datePickerChanged() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        return strDate
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let abortButton = UIAlertAction(title: abortButtonText, style: .default, handler: {_ in print("abort")})
        let deleteButton = UIAlertAction(title: deleteButtonText, style: .destructive, handler: {_ in print("del")})
        alert.addAction(abortButton)
        alert.addAction(deleteButton)
        present(alert, animated: true)
    }
    
    //MARK: @objc functions
    @objc private func dismissAction() {
        dismiss(animated: true)
    }

    @objc private func saveAction() {
        print("saveTapped")
    }
    
    @objc private func selectColor() {
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            present(colorPicker, animated: true)
        }
    
    @objc private func datePickerAction() {
        scheduleLabel.text = "Каждый день в \(datePickerChanged())"
    }
    
    @objc private func removeAction() {
        showAlert()
    }
}

//MARK: extension constraints
extension HabitViewController {
    
    private func setupConstraints() {
        let leftSideInset: CGFloat = 15
        let upSideInset: CGFloat = 7
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftSideInset),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.widthAnchor.constraint(equalToConstant: 74),
            
            nameTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: upSideInset),
            nameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftSideInset),
            nameTextfield.heightAnchor.constraint(equalToConstant: 22),
            nameTextfield.widthAnchor.constraint(equalToConstant: 295),
            
            colorLabel.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: upSideInset),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftSideInset),
            colorLabel.heightAnchor.constraint(equalToConstant: 18),
            colorLabel.widthAnchor.constraint(equalToConstant: 36),
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: upSideInset),
            colorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftSideInset),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            
            scheduleLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: upSideInset),
            scheduleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftSideInset),
            scheduleLabel.heightAnchor.constraint(equalToConstant: 22),
            scheduleLabel.widthAnchor.constraint(equalToConstant: 194),
            
            datePicker.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: upSideInset),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 216),
            datePicker.widthAnchor.constraint(equalToConstant: 375),
            
            removeButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 219),
            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -5),
            removeButton.heightAnchor.constraint(equalToConstant: 22),
            removeButton.widthAnchor.constraint(equalToConstant: 147),
        ])
        
    }
}
//MARK: extension UIColorPickerViewControllerDelegate
extension HabitViewController: UIColorPickerViewControllerDelegate {

    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        self.colorButton.backgroundColor = color
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.colorButton.backgroundColor = color
    }
}
//MARK: extension hideKeyboard
extension HabitViewController {
    
    private func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action:  #selector(dissmissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dissmissKeyBoard() {
        view.endEditing(true)
    }
}
