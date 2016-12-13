//
//  ViewController.swift
//  SwitchBetweenApps
//
//  Created by ddn on 16/12/13.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //跳回去，其中的scheme可以通过url传递过来，最好是定好scheme，让其设置
        let url = URL(string: "Test://")!
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
    
    //http://www.jianshu.com/p/5b7571d7bb34
    @IBAction func go() {
        
        guard let version = Double(UIDevice.current.systemVersion)
            else {return}
        //ios10之后变为私有api，只能跳UIApplicationOpenSettingsURLString自己的应用设置（那其实就没啥鸟用了）
        if version < 10.0 {
            let url = URL(string: urlTextField.text!)!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
        } else {
            let url = URL(string: UIApplicationOpenSettingsURLString)!
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: { (finish) in
                        print(finish)
                    })
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
    }

}

