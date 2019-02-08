//
//  EventDetailViewController.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    var searchDetailView = SearchDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchDetailView)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        
    }
    

}

extension SearchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

