//
//  ViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit

class ConverstionViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        
       
        }
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isLogedIn=UserDefaults.standard.bool(forKey: "logged_ins")
        
        if !isLogedIn{
            
            let loginVC=LoginViewController()
            
            let navLogin=UINavigationController(rootViewController: loginVC)
            
            navLogin.modalPresentationStyle = .fullScreen
            
            present(navLogin, animated: false)
    }


}
    }
    
  

