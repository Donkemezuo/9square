//
//  ListViewController.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var detailText = "We made it here"
    var listView = ListView()
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.addSubview(listView)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.listView.searchTableView.dataSource = self
        self.listView.searchTableView.delegate = self
        setConstrains()
        
    }
    
    func setConstrains(){
      
        NSLayoutConstraint.activate([
            listView.searchTableView.topAnchor.constraint(equalTo: view.topAnchor),
            listView.searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            ])
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = detailText
        cell.backgroundColor =  UIColor.blue.withAlphaComponent(0.3)
        return cell
        
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ListDetailViewController(name: detailText)
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
