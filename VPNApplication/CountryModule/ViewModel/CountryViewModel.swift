//
//  CountryViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol BindDelegate: class {
    func bindWithCountryViewModel(_ vc: UIViewController)
}


class CountryViewModel:BindDelegate {
    
    var router:RouterProtocol?
    
    
    init(router:RouterProtocol) {
        self.router = router
    }
    
    func bindWithCountryViewModel(_ vc: UIViewController) {
        
    }
}
