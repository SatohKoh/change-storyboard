//
//  RegisterViewController.swift
//  ChangeStoryBoard
//
//  Created by 佐藤恒 on 2019/01/20.
//  Copyright © 2019年 佐藤恒. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userName = userNameTextField.text
        let password = passwordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        // 空白確認
        if (userName == "" || password == "" || repeatPassword == "") {
            displayAlertMessage(userMessage: "全てのフォームに入力してください。")
            return
        }
        
        // パスワード一致確認
        if (password != repeatPassword) {
            displayAlertMessage(userMessage: "パスワードが一致していません。")
            return
        }
        
        // データ登録
        UserDefaults.standard.set(userName, forKey:"userName")
        UserDefaults.standard.set(password, forKey:"password")
        
        // 画面遷移
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
}
