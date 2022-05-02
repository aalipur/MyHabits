//
//  SceneDelegate.swift
//  MyHabits
//
//  Created by Анатолий Алипур on 09.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        //window?.rootViewController = createTabBar()
        window?.rootViewController = TabBarController()
        //window?.rootViewController = HabitDetailsViewController()
        window?.makeKeyAndVisible()
    }
    
    func createHabitsNavigigationController() -> UINavigationController {
        let habitsVC = HabitsViewController()
        habitsVC.title = "Привычки"
        habitsVC.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), tag: 0)
        //habitsVC.tabBarItem.setTitleTextAttributes(<#[NSAttributedString.Key : Any]?#>, for: .selected)
        return UINavigationController(rootViewController: habitsVC)
    }
    
    func createInfoNavigigationController() -> UINavigationController {
        let infoVC = InfoViewController()
        infoVC.title = "Информация"
        infoVC.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        return UINavigationController(rootViewController: infoVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        //UITabBar.appearance().tintColor = .specialBlue
        //UITabBar.appearance().selectedItem?.badgeColor = .specialPurple
        tabBar.view.backgroundColor = .specialBackgroundTabBar
        tabBar.viewControllers = [createHabitsNavigigationController(), createInfoNavigigationController()]
        return tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

