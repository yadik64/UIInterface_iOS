//
//  LoginFormViewController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 28/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.becomeFirstResponder()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func authorizationButton() {
        
        guard let login = self.loginTextField.text else {
            return
        }
        guard let password = self.passwordTextField.text else {
            return
        }
        
        if login == "admin" && password == "123456" {
            print("Доступ разрешен!")
        } else {
            createAlert(title: "Ошибка", message: "Неверный логин или пароль", style: .alert)
        }
        
    }
    
    
    func createAlert(title: String, message: String, style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionOK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alertController.addAction(actionOK)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func keyboardWasShow(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}

extension LoginFormViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.loginTextField:
            self.passwordTextField.becomeFirstResponder()
        case self.passwordTextField:
            passwordTextField.resignFirstResponder()
            authorizationButton()
        default:
            break
        }
        return true
    }
    
}
