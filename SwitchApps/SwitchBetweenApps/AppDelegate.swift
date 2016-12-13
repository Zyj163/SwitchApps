//
//  AppDelegate.swift
//  SwitchBetweenApps
//
//  Created by ddn on 16/12/13.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        
        let url: URL! = URL(string: "http://www.baidu.com/query?name=sb")
        
        print("scheme====" + url.scheme!)//协议，用什么应用打开，是由协议决定的
        print("host====" + url.host!)//主机
        print("path====" + url.path)//路径
        print("query====" + url.query!)//参数
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return handleUrl(url)
    }


    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return handleUrl(url)
    }
    
}

extension AppDelegate {
    fileprivate func handleUrl(_ url: URL) -> Bool {
        
        let nav = window?.rootViewController as! UINavigationController
        nav.popToRootViewController(animated: false)
        
        if url.host == "friends" {
            nav.childViewControllers[0].performSegue(withIdentifier: "toFriends", sender: nil)
        } else {
            nav.childViewControllers[0].performSegue(withIdentifier: "toChats", sender: nil)
        }
        
        return true
    }
}

