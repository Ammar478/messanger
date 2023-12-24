//
//  ProfileViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class ProfileViewController: UIViewController {
    
    private let spinner = JGProgressHUD(style: .dark)

    let data=["Log Out"]
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate=self
        tableView.dataSource=self
        
    }

}

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=data[indexPath.row]
        cell.textLabel?.textColor  = .red
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        let signoutAlert=UIAlertController(title: "Do you want to signout", message: "", preferredStyle:.actionSheet)
        signoutAlert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {[weak self] _ in
        
            guard let storngSelf = self else{
                return
            }
            
            do{
                storngSelf.spinner.show(in: storngSelf.view)
                try FirebaseAuth.Auth.auth().signOut()
                
                let loginVC=LoginViewController()
                
                let navLogin=UINavigationController(rootViewController: loginVC)
                
                navLogin.modalPresentationStyle = .fullScreen
                
                storngSelf.present(navLogin, animated: false)
                storngSelf.spinner.dismiss()
                
            }catch{
                print("Field to signOut")
            }
            
        }))
        
        signoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(signoutAlert,animated: true)
      
    }
}
