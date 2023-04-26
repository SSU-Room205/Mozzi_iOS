//
//  MainTabBarController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.makeCornerRound(radius: 10)
        
        let mapNC = UINavigationController.init(rootViewController: MapViewController())
        let mainNC = UINavigationController.init(rootViewController: MainViewController())
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController())
        
        
        let homeImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        let mapImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        let mypageImage = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        
        let selectedHomeImage = UIImage(named: "home_fill")?.withRenderingMode(.alwaysOriginal)
        let selectedMapImage = UIImage(named: "map_fill")?.withRenderingMode(.alwaysOriginal)
        let selectedMypageImage = UIImage(named: "mypage_fill")?.withRenderingMode(.alwaysOriginal)
        
        self.viewControllers = [mapNC,mainNC,mypageNC]
        
        let mapTabBarItem = UITabBarItem(title: " ", image: mapImage, tag: 0 )
        let mainTabBarItem = UITabBarItem(title: " ", image: homeImage, tag: 1)
        let mypageTabBarItem = UITabBarItem(title: " ", image: mypageImage, tag: 2)
        
        mapTabBarItem.selectedImage = selectedMapImage
        mainTabBarItem.selectedImage = selectedHomeImage
        mypageTabBarItem.selectedImage = selectedMypageImage
        
        mapNC.tabBarItem = mapTabBarItem
        mainNC.tabBarItem = mainTabBarItem
        mypageNC.tabBarItem = mypageTabBarItem
        
        self.selectedIndex = 1 // 원하는 인덱스
        self.tabBar.backgroundColor = .mozziMain
        
        
    }
    //탭바 높이 변경
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = self.view.frame.size.height - 100
        self.tabBar.frame = tabFrame

    }
}


