//
//  ViewController.swift
//  Tyanmao
//
//  Created by 優樹永井 on 2019/07/02.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1Action() {
        let postObject = NCMBObject(className: "Post")
        let user = NCMBUser.current()
        postObject?.setObject(self.button1.titleLabel?.text, forKey: "text")
        postObject?.setObject(user, forKey: "user")
        postObject?.saveInBackground({ (error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error!.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                let text = postObject?.object(forKey: "text")
                self.label.text = text as? String
            }
        })
    }
    
    @IBAction func button2Action() {
        let postObject = NCMBObject(className: "Post")
        let user = NCMBUser.current()
        postObject?.setObject(self.button2.titleLabel?.text, forKey: "text")
        postObject?.setObject(user, forKey: "user")
        postObject?.saveInBackground({ (error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error!.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                let text = postObject?.object(forKey: "text")
                self.label.text = text as? String
            }
        })
    }
    
    @IBAction func button3Action() {
        let postObject = NCMBObject(className: "Post")
        let user = NCMBUser.current()
        postObject?.setObject(self.button3.titleLabel?.text, forKey: "text")
        postObject?.setObject(user, forKey: "user")
        postObject?.saveInBackground({ (error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error!.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                let text = postObject?.object(forKey: "text")
                self.label.text = text as? String
            }
        })
    }


}

