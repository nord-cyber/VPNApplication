//
//  MainScreenViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol  MainScreenViewModelProtocol {
    var mainViewData:((Connection) -> ())? { get set }
    var router:RouterProtocol? { get }
    func tapForConnect(data:Connection.DataAboutCountry?)
    func tappedOnMenu(_ vc:UIViewController)
}

class MainScreenViewModel:MainScreenViewModelProtocol {
    var mainViewData: ((Connection) -> ())?
    var router: RouterProtocol?
    init(router:RouterProtocol) {
        self.router = router
        mainViewData?(.notConnection)
    }
    // trigger when tapped in button connect
    func tapForConnect(data:Connection.DataAboutCountry?) {
        
        if  data != nil {
            mainViewData?(.failure(.notChooseCountry))
        }
        print("Connecting with server from \(String(data?.country ?? "")) ...")
        DispatchQueue.main.async {
            self.mainViewData?(.connection(Connection.DataAboutCountry(country: data?.country, imageOfCountry: data?.imageOfCountry)))
        }
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [unowned self] (timer) in
            print("Connected!")
            self.mainViewData?(.success(Connection.DataAboutCountry(country: data?.country, imageOfCountry: data?.imageOfCountry)))
        }
    }
    
    func tappedOnMenu( _ vc:UIViewController) {
        router?.menuController(from: vc)
    }
}
