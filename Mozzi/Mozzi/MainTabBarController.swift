//
//  MainTabBarController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/03/12.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = UIColor.white
                
        let mapNC = UINavigationController.init(rootViewController: MapViewController())
        let mainNC = UINavigationController.init(rootViewController: MainViewController())
        let mypageNC = UINavigationController.init(rootViewController: MypageViewController())
        
        let homeImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        let mapImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        let mypageImage = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)
        
        let selectedHomeImage = UIImage(named: "home_fill")?.withRenderingMode(.alwaysOriginal)
        let selectedMapImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        let selectedMypageImage = UIImage(named: "mypage")?.withRenderingMode(.alwaysOriginal)

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
        self.tabBar.backgroundColor = UIColor(named: "Dark Color")
        // Do any additional setup after loading the view.
    }
    //탭바 높이 변경
    override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                var tabFrame = self.tabBar.frame
                tabFrame.size.height = 100
                tabFrame.origin.y = self.view.frame.size.height - 100
                self.tabBar.frame = tabFrame
            }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
