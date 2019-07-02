//
//  SignInViewController.swift
//  Twitter
//
//  Created by Ryota Nomura on 2019/04/14.
//  Copyright © 2019 GeekSalon. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class SignInViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet var userIdTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIdTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signIn() {
        
        if (userIdTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0 {
            
            NCMBUser.logInWithUsername(inBackground: userIdTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    SVProgressHUD.showError(withStatus: error!.localizedDescription)
                } else {
                    if user?.object(forKey: "active") as? Bool == false {
                        SVProgressHUD.setStatus("そのユーザーは退会済みです。")
                    } else {
                        // ログイン成功
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let rootViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                        UIApplication.shared.keyWindow?.rootViewController = rootViewController
                        
                        // ログイン状態の保持
                        let ud = UserDefaults.standard
                        ud.set(true, forKey: "isLogin")
                        ud.synchronize()
                    }
                }
            }
        }
    }
    
}
