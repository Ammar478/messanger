//
//  ViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit
import FirebaseAuth

class ConverstionViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        }
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            
            let loginVC=LoginViewController()
            
            let navLogin=UINavigationController(rootViewController: loginVC)
            
            navLogin.modalPresentationStyle = .fullScreen
            
            present(navLogin, animated: false)
    }


}
    }
    
  

