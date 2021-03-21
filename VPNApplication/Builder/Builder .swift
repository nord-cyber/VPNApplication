//
//  Builder .swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol BuilderProtocol {
    func createMainVC(router:RouterProtocol) -> UIViewController
    func createMenuVC(router:RouterProtocol) -> UIViewController
    func createCountryVC(router:RouterProtocol) -> UIViewController
}

class Builder:BuilderProtocol {
    
    func createMainVC(router:RouterProtocol) -> UIViewController {
        let mainVC = MainScreenController()
        let mainViewModel = MainScreenViewModel(router: router)
        mainVC.mainViewModel = mainViewModel
        return mainVC
    }
    
    func createMenuVC(router:RouterProtocol) -> UIViewController {
        let menuVC = MenuController()
        let menuViewModel = MenuViewModel(router: router)
        menuVC.viewModel = menuViewModel
        return menuVC
    }
    
    func createCountryVC(router: RouterProtocol) -> UIViewController {
        
        let countryVC = CountryController()
        let countryViewModel = CountryViewModel(router: router)
        let tableView = CountryTableView()
        let tableViewModel = CountryTableViewViewModel()
        
        countryVC.tableView = tableView
        countryVC.viewModel = countryViewModel
        tableView.tableViewModel = tableViewModel
        
        return countryVC
    }
}
