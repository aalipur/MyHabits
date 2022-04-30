//
//  UITableViewCell + Extensions.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 30.04.2022.
//

import UIKit

extension UITableViewCell {
    
    func setupContentCell(index: IndexPath.Element) -> String  {
        let store = HabitsStore.shared
        let date = store.habits[index].date
//        guard index == 0 else { return data.description }
//        let step = index
//        let dataDescription = data.addTimeInterval(86400 * Double(step))
        let modifiedDay = Calendar.current.date(byAdding: .day, value: 1, to: date) ?? Date()
        
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "d MMMM y"
         let hourString = dateFormatter.string(from: modifiedDay)
        return "\(hourString.description)"
    }
}
