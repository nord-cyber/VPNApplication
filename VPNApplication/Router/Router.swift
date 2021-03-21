//
//  Router.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol RouterOverall {
    var builder:BuilderProtocol? { get set }
}

protocol RouterProtocol {
    func mainController() -> UIViewController?
    func menuController(from vc: UIViewController)
    func countryController(from vc: UIViewController)
    func toRootController(from vc:UIViewController)
}

typealias RouterPresentProtocol = RouterOverall & RouterProtocol

class Router:RouterPresentProtocol {
    var builder: BuilderProtocol?
    
    init(builder:BuilderProtocol) {
        self.builder = builder
    }
    
    func mainController() -> UIViewController? {
        if builder != nil {
            guard let mainVC = builder?.createMainVC(router: self) else { return nil}
            return mainVC
        }
       return nil
    }
    
    func menuController(from vc: UIViewController) {
        if builder != nil {
            guard let menuVC = builder?.createMenuVC(router: self) else { return }
            vc.present(menuVC, animated: true, completion: nil)
            
        }
    }
    
    func countryController(from vc: UIViewController) {
        if builder != nil {
            guard let countryVC = builder?.createCountryVC(router: self) else { return }
            vc.present(countryVC, animated: true, completion: nil)
        }
    }
    
    func toRootController(from vc:UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
}
