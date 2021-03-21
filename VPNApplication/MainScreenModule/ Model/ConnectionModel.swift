//
//  ConnectionModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit


enum Connection{
    case notConnection
    case connection(DataAboutCountry)
    case success(DataAboutCountry)
    case failure(FailureConnection)
    
    enum FailureConnection {
        case lostConnection
        case problemWithInternet
        case serverNotAvailable
        case notChooseCountry 
    }
    
    struct DataAboutCountry {
        let country:String?
        let imageOfCountry:UIImage?
    }
}
