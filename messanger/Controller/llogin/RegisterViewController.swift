//
//  RegisterViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView:UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    private let imageView:UIImageView = {
        var imageView=UIImageView()
        imageView.image=UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.image?.withTintColor(.gray)
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds=true
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
    private let firstNameField:UITextField={
        let field=UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius=12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First name"
        field.keyboardType = .default
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.rightViewMode = .always
        field.backgroundColor = .white
        field.textAlignment = .center

        return field
    }()
    private let lastNameField:UITextField={
        let field=UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius=12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last Name"
        field.keyboardType = .default
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
    
    private let regiestButton:UIButton={
        let button=UIButton()
        button.layer.cornerRadius=12
        button.layer.borderWidth=1
        button.layer.borderColor = .none
        button.backgroundColor = .systemGreen
        button.setTitle("Registor", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds=true
        button.titleLabel?.font = .systemFont(ofSize: 23)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.delegate=self
        lastNameField.delegate=self
        emailField.delegate=self
        passwordField.delegate=self
        
        title="Create Account "
        view.backgroundColor = .white
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(regiestButton)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        
        imageView.isUserInteractionEnabled=true
        scrollView.isUserInteractionEnabled=true
        
        let gesture=UITapGestureRecognizer(target: self, action: #selector(updateAvatarTapped))
        
        imageView.addGestureRecognizer(gesture)
        
    }
    
    @objc func updateAvatarTapped(){
        presentPhotoActionsSheet()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        imageView.frame=CGRect(x: (scrollView.width-size)/2, y: scrollView.top+100, width: size, height: size)
        imageView.layer.cornerRadius=imageView.width/2.0
        firstNameField.frame=CGRect(x: 30, y: imageView.bottom+20, width: scrollView.width-50, height: 52)
        lastNameField.frame=CGRect(x: 30, y: firstNameField.bottom+20, width: scrollView.width-50, height: 52)
        emailField.frame=CGRect(x: 30, y: lastNameField.bottom+20, width: scrollView.width-50, height: 52)
        passwordField.frame=CGRect(x: 30, y: emailField.bottom+20, width: scrollView.width-50, height: 52)
        regiestButton.frame=CGRect(x: 30, y: passwordField.bottom+20, width: scrollView.width-50, height: 52)

        
    }
    
    
    @objc private func regiestButtonTapped(){
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email=emailField.text ,
              let password = passwordField.text ,
              let firstName=firstNameField.text,
              let lastName=lastNameField.text,
              !email.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !password.isEmpty,
              password.count >= 6 else{
            
            alrtUserLoginError()
            return
        }
        
    }

     func alrtUserLoginError(){
         let alert = UIAlertController(title: "Woops", message: "please fill all the field to create new account", preferredStyle: .alert)
         
         alert.addAction(UIAlertAction.init(title: "Dismess", style: .cancel, handler: nil))
         
         present(alert ,animated: true)
    }

}


extension RegisterViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField)
        if textField==firstNameField{
            lastNameField.becomeFirstResponder()
        }else
        if textField == lastNameField{
            emailField.becomeFirstResponder()
        }else
        if textField==emailField{
            passwordField.becomeFirstResponder()
        }else
             if textField==passwordField{
                regiestButtonTapped()
            }
            return true
        }
    }

extension RegisterViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func presentPhotoActionsSheet(){
        let actionSheet=UIAlertController(title: "Profile Picture", message: "How would you like to select pictur", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in
            self?.presentCamera()
            }))
        
        actionSheet.addAction(UIAlertAction(title: "Chose Photo", style: .default, handler: {[weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        present(actionSheet ,animated: true)
    }
    
    func presentCamera(){
        let cameraVC=UIImagePickerController()
        cameraVC.sourceType = .camera
        cameraVC.delegate=self
        cameraVC.allowsEditing=true
        present(cameraVC,animated: true)
         
    }
    
    func presentPhotoPicker(){
        let cameraVC=UIImagePickerController()
        cameraVC.sourceType = .photoLibrary
        cameraVC.delegate=self
        cameraVC.allowsEditing=true
        present(cameraVC,animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true,completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        
        self.imageView.image = selectedImage
    }
}
