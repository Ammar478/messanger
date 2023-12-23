
import UIKit
import FirebaseAuth
import JGProgressHUD

class ConverstionViewController: UIViewController {
    
    private let chatsTabelView:UITableView={
        let chatsTabelView=UITableView()
        
        chatsTabelView.isHidden = true
        chatsTabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return chatsTabelView
    }()
    
    private let noChatsFoundLabelView:UILabel={
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.textAlignment = .center
        label.text = "No Conversations!"
        label.isHidden = true
        return label
    }()
    
    private let spinner = JGProgressHUD(style: .dark)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chatsTabelView)
        view.addSubview(noChatsFoundLabelView)
        setupTableView()
        fetchChats()
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapNewChat))

        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chatsTabelView.frame = view.bounds
    }
  
    
    override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    validationAuth()
        

}
    
    @objc private func didTapNewChat (){
        let registorVC=NewConverstionViewController()
        
        let regisotrNav=UINavigationController(rootViewController: registorVC)
        
        regisotrNav.modalPresentationStyle = .fullScreen
        
        registorVC.title = "New conversation"
        
        present(regisotrNav,animated: true)
       
   }
    
    private func validationAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil {
            
            let loginVC=LoginViewController()
            
            let navLogin=UINavigationController(rootViewController: loginVC)
            
            navLogin.modalPresentationStyle = .fullScreen
            
            present(navLogin, animated: false)
    }
    }
    
    private func setupTableView(){
        chatsTabelView.delegate = self
        chatsTabelView.dataSource = self
    }
    
    private func fetchChats(){
        chatsTabelView.isHidden = false
    }
    
    }

extension ConverstionViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatsTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        cell.textLabel?.text = "Hello words"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chatsTabelView.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController()
        vc.title = "Dummy Name"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
  

