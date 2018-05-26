//
//  ViewController.swift
//
//  Created by Geektree0101.
//  Copyright(C) 2018 Geektree0101. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    struct Const {
        static let identifier: String = "TestCellIdentifier"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test Table List"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TestCell.self,
                                forCellReuseIdentifier: Const.identifier)
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: Const.identifier) as! TestCell
        return cell
    }
}

