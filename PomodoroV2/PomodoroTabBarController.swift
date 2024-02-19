//
//  PomodoroTabBarController.swift
//  PomodoroV2
//
//  Created by Pascal on 19.02.24.
//

import UIKit

final class PomodoroTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        setTabBarApperance()
    }
    
    private func createTabBar(){
        viewControllers = [
            generateVC(viewController: StatisticViewController(), title: "Statistic", image: UIImage(systemName: "chart.bar")),
            generateVC(viewController: MainScreenViewController(), title: "Flow", image: UIImage(systemName: "gauge.with.needle")),
            generateVC(viewController: SettingViewController(), title: "Settings", image: UIImage(systemName: "gear"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer =  CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect:
                                        CGRect(x: positionOnX,
                                               y: tabBar.bounds.minY - positionOnY,
                                               width: width,
                                               height: height),
                                      cornerRadius: height/2)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = UIColor.black.cgColor
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.gray
    }
    
}
