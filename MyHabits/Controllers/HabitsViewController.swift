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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialLightGray
        setupViews()
    }

//MARK: functions
    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
    }
    
    @objc private func addHabit() {
        print("addHabitButtonTapped")
    }
}

