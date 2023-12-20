//
//  LoginViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView:UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    private let imageView:UIImageView = {
        var imageView=UIImageView()
        imageView.image=UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let emailField:UITextField={
        let field=UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius=12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "example@gmail.com"
        field.keyboardType = .emailAddress
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.rightViewMode = .always
        field.backgroundColor = .white
        field.textAlignment = .center

        
        return field
    }()
    
    private let passwordField:UITextField={
        let field=UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius=12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "pass*****"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.rightViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.textAlignment = .center
        
        return field
    }()
    
    private let loginButton:UIButton={
        let button=UIButton()
        button.layer.cornerRadius=12
        button.layer.borderWidth=1
        button.layer.borderColor = .none
        button.backgroundColor = .link
        button.setTitle("LogIn", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds=true
        button.titleLabel?.font = .systemFont(ofSize: 23)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate=self
        passwordField.delegate=self
        
        title="Login "
        view.backgroundColor = .systemGray4
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Resgister", style: .plain, target: self, action: #selector(didTapRegiester))
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
       
        imageView.frame=CGRect(x: (scrollView.width-size)/2, y: scrollView.top+100, width: size, height: size)
        emailField.frame=CGRect(x: 30, y: imageView.bottom+20, width: scrollView.width-50, height: 52)
        passwordField.frame=CGRect(x: 30, y: emailField.bottom+20, width: scrollView.width-50, height: 52)
        loginButton.frame=CGRect(x: 30, y: passwordField.bottom+20, width: scrollView.width-50, height: 52)

        
    }
    
    @objc private func didTapRegiester (){
        let registorVC=RegisterViewController()
        
        let regisotrNav=UINavigationController(rootViewController: registorVC)
        
        regisotrNav.modalPresentationStyle = .fullScreen
        
        registorVC.title="Create Account"
        
        present(regisotrNav,animated: false)
       
   }
    
    @objc private func loginButtonTapped(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email=emailField.text , let password = passwordField.text ,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else{
            
            alrtUserLoginError()
            return
        }
    }

     func alrtUserLoginError(){
         let alert = UIAlertController(title: "Woops", message: "plz dont left the field empty", preferredStyle: .alert)
         
         alert.addAction(UIAlertAction.init(title: "Dismess", style: .cancel, handler: nil))
         
         present(alert ,animated: true)
    }

}

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField==emailField{
            passwordField.becomeFirstResponder()
        }else
             if textField==passwordField{
                loginButtonTapped()
            }
            return true
        }
    }

