//
//  TableViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import Foundation


enum TableViewData:String {
    case menu = "Country connection"
    
   static func getNamesLines() -> [String] {
        var names = [String]()
        names.append(TableViewData.menu.rawValue)
        return names
    }
}
