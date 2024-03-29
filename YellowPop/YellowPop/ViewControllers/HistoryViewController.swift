//
//  HistoryViewController.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/26/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class HistoryViewController: BaseViewController {
    
    var viewModel:ViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.cell)
        self.tableView.tableFooterView = UIView()
    }
    
}

// MARK: - UITableView

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getHistoryTotal() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cell, for: indexPath)
        cell.textLabel?.text = self.viewModel?.getHistory()[indexPath.row].desc
        return cell
    }
    
}
