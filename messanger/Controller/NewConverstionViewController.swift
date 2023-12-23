//
//  NewConverstionViewController.swift
//  messanger
//
//  Created by Ammar Ahmed on 06/06/1445 AH.
//

import UIKit

class NewConverstionViewController: UIViewController {
    
    private let searchBar:UISearchBar={
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for Users .."
        return searchBar
    }()
    
    private let tabelView:UITableView={
        let tabelView = UITableView()
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabelView.isHidden = true
        return tabelView
    }()
    
    private let noContentLabel:UILabel={
        let label=UILabel()
        label.text = "No Content found"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 21,weight: .medium)
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white

        navigationController?.navigationBar.topItem?.titleView=searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dissmisedSearch))
        
        searchBar.becomeFirstResponder()
    }
    
    @objc private func dissmisedSearch(){
        dismiss(animated: true)
    }

}

extension NewConverstionViewController:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
