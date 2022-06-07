//
//  TabBarController.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let tabBarHeight: CGFloat = 95
   
    private let searchVC = UINavigationController(rootViewController: HomeViewController())
    private let wishListVC = UINavigationController(rootViewController: WishListViewController())
    private let myReservationVC = UINavigationController(rootViewController: MyReservationViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        configureView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = tabBarHeight
        tabBarFrame.origin.y = view.frame.size.height - tabBarHeight
        tabBar.frame = tabBarFrame
    }
    
    private func setUpTabBar() {
        searchVC.title = Title.searchTabBarTitle
        wishListVC.title = Title.wishListTabBarTitle
        myReservationVC.title = Title.myReservationTabBarTitle
        
        searchVC.tabBarItem.image = Icon.searchTabBarIcon
        wishListVC.tabBarItem.image = Icon.wishListTabBarIcon
        myReservationVC.tabBarItem.image = Icon.myReservationTabBarIcon
    }
    
    private func configureView() {
        tabBar.tintColor = .primary
        tabBar.backgroundColor = .gray6
        
        setViewControllers([searchVC, wishListVC, myReservationVC], animated: false)
    }
}
