//
//  menuViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


protocol MenuViewModelProtocol {
    init(router:RouterProtocol)
    func backTapped(_ vc:UIViewController)
    func bindWithCountryVC(_ vc:UIViewController)
}

class MenuViewModel:MenuViewModelProtocol {
   
    

    var router:RouterProtocol?
    
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    func bindWithCountryVC(_ vc: UIViewController) { router?.countryController(from: vc) }
    
    func backTapped(_ vc:UIViewController) { router?.toRootController(from: vc) }
}
