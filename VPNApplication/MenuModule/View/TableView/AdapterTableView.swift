//
//  AdapterTableView.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol  BindWithMenuDelegate: class {
    func bindWithMenu()
}


class AdapterTableView:UITableView {
    
    weak var bindDelegate:BindWithMenuDelegate?
     var viewModel:TableViewModelProtocol?
    
    private var cells = [String]()
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        self.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        self.separatorStyle = .none
        cells = viewModel!.getNamesFromModel()
    }
}

extension AdapterTableView:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = cells[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bindDelegate?.bindWithMenu()
    }
    
}
