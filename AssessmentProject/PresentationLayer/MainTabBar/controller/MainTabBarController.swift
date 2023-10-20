//
//  MainTabBarController.swift
//  AssessmentProject
//
//  Created by Ku Ku Zan on 10/19/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .black
        tabBar.tintColor = .white
        setupVCs()
        setupMiddleButton()
        self.selectedIndex = 1
    }
    

    func setupVCs() {
        viewControllers = [
            createNavController(for: UIViewController(), image: UIImage(named: "chat")!),
            createNavController(for: GridViewController(), image: UIImage(named: "grid")!),
            createNavController(for: UIViewController(), image: UIImage(named: "group")!),
            createNavController(for: UIViewController(), image: UIImage(named: "noti")!),
            createNavController(for: UIViewController(), image: UIImage(named: "user")!),
        ]
    }
    
    fileprivate func createNavController(
        for rootViewController: UIViewController,
        image: UIImage
    ) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 30, y: -10, width: 60, height: 60))
        
        middleButton.setBackgroundImage(UIImage(named: "group"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }

}
