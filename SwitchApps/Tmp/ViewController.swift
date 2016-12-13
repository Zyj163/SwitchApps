//
//  ViewController.swift
//  Tmp
//
//  Created by ddn on 16/12/13.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func toFriends() {
        let url = URL(string: "SwitchBetweenApps://friends")!
        openUrl(url)
    }
    
    @IBAction func toChats() {
        let url = URL(string: "SwitchBetweenApps://chats")!
        openUrl(url)
    }

    fileprivate func openUrl(_ url: URL!) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (finish) in
                    print(finish)
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

}

