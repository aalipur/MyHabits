//
//  TabBarController.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 09.04.2022.
//

import UIKit

class TabBarController: UITabBarController {

     override func viewDidLoad() {
         super.viewDidLoad()
         setupTabBar()
         view.backgroundColor = .specialOrange
     }
     
     private func setupTabBar() {
         tabBar.backgroundColor = .specialBackgroundTabBar
         let habitsViewController = createNavController(vc: HabitsViewController(), itemName: "Привычки", itemImage: "rectangle.grid.1x2.fill")
         let infoViewController = createNavController(vc: InfoViewController(), itemName: "Информация", itemImage: "info.circle.fill")
         viewControllers = [habitsViewController, infoViewController]
     }
 }

//MARK: extensions
extension TabBarController {
    
    private func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 15,
                                                                                                                      left: 0,
                                                                                                                      bottom: 0,
                                                                                                                      right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
}
