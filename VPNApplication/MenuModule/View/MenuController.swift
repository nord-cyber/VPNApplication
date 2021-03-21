//
//  MenuController.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit





class MenuController: UIViewController, BindWithMenuDelegate {
 
    
    private let nibNamed = "MenuView"
    
    @IBOutlet weak var tableView: AdapterTableView! {
        didSet {
            tableView.viewModel = TableViewViewModel()
            tableView.setup()
            tableView.bindDelegate = self
        }
    }
    
    var viewModel:MenuViewModelProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setup()
    }
    
    private func setup() {
       Bundle.main.loadNibNamed(nibNamed, owner: self, options: nil)
        self.view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
    
    @IBAction func tapped(_ sender: Any) {
        viewModel?.backTapped(self)
    }
    
    func bindWithMenu() {
        viewModel?.bindWithCountryVC(self)
    }
}
