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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Login "
        view.backgroundColor = .systemGray4
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Resgister", style: .plain, target: self, action: #selector(didTapRegiester))
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
       
        imageView.frame=CGRect(x: (scrollView.width-size)/2, y: scrollView.top+100, width: size, height: size)
        emailField.frame=CGRect(x: 30, y: imageView.bottom+20, width: scrollView.width-50, height: 52)
        passwordField.frame=CGRect(x: 30, y: emailField.bottom+20, width: scrollView.width-50, height: 52)
        
    }
    
    @objc private func didTapRegiester (){
        let registorVC=RegisterViewController()
        
        let regisotrNav=UINavigationController(rootViewController: registorVC)
        
        regisotrNav.modalPresentationStyle = .fullScreen
        
        registorVC.title="Create Account"
        
        present(regisotrNav,animated: false)
       
   }

 

}
