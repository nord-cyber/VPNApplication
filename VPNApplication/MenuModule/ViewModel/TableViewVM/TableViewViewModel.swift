//
//  TableViewViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import Foundation

protocol TableViewModelProtocol: class {
    func getNamesFromModel() -> [String]
}

class TableViewViewModel:TableViewModelProtocol {
      
    func getNamesFromModel() -> [String] {
        let countryLine = TableViewData.menu.rawValue
        return [countryLine]
    }
}
