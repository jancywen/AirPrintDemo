//
//  ViewController.swift
//  AirPrintDemo
//
//  Created by wangwenjie on 2018/8/24.
//  Copyright © 2018年 Roo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPrintInteractionControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func printPdf(_ sender: Any) {
        
        let pic = UIPrintInteractionController.shared
        let urlstr = "https://gm.api.hidoctor.cc/router/rest?method=hidoctor.attachment.downloadpdf&format=binary&v=1.0&fileKey=195806C327494834918FCDA1946683C5&isOnLine=true"
        if UIPrintInteractionController.canPrint(URL(string: urlstr)!) {
            pic.printingItem = URL(string: urlstr)!
            
            
            let completedHandler: (UIPrintInteractionController, Bool, Error?) -> Void = { (vc, completed, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "打印失败")
                }
                if completed {
                    print("打印完成")
                }
            }
            
            
            if UI_USER_INTERFACE_IDIOM() == .pad {
                // 设置的rect并没有起作用
                pic.present(from: CGRect(x: 0, y: 0, width: 360, height: 300), in: self.view, animated: true, completionHandler: completedHandler)
            }else {
                pic.present(animated: true, completionHandler: completedHandler)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

