//
//  AboutAppViewController.swift
//  PhotoEditor
//
//  Created by Hilmy Fauzi on 28/9/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController {

    override func viewDidLoad() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "cmra@1x.png")
        self.view.insertSubview(backgroundImage, at: 0)
        
        super.viewDidLoad()
        let color2 = UIColor.white
        let color3 = UIColor.yellow
        
        //deklarasi tabbar
        let tabbar = self.tabBarController?.tabBar
        tabbar?.tintColor = color3
        //bar tint
        tabbar?.barTintColor = UIColor.orange
        //tab bar ga di klik
        tabbar?.unselectedItemTintColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
