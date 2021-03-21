//
//  CountryController.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


class CountryController:UIViewController {
    
    weak var viewModel:BindDelegate?
    var tableView:CountryTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    }
    
    private func setup() {
        self.view.backgroundColor = #colorLiteral(red: 0.7215686275, green: 0.7921568627, blue: 0.9725490196, alpha: 1)
        self.view.addSubview(tableView)
        tableView.frame = view.frame
    }
}
