//
//  ViewController.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

class MainScreenController: UIViewController {

    var mainViewModel:MainScreenViewModelProtocol!
    let button = ButtonConnection(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.center = view.center
        button.addTarget(self, action: #selector(handleConnection), for: .touchUpInside)
        self.view.addSubview(button)
    }

    
    @objc func handleConnection() {
       
        
        
        mainViewModel.tapForConnect(data: Connection.DataAboutCountry(country: "USA", imageOfCountry: nil))
        mainViewModel.mainViewData = {[weak self] data in
            switch data {
            case .connection(_):
                self?.button.animatingButton(isAnimating: true)
            case .success(_):
                self?.button.animatingButton(isAnimating: false)
            default:
                break
            }
        }
    }
    
    @IBAction func MenuTap(_ sender: Any) {
        mainViewModel.tappedOnMenu(self)
    }
    
}

