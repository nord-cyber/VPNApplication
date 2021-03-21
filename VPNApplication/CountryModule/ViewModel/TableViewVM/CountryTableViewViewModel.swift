//
//  TableViewViewModel.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import Foundation

protocol CountryTableViewModelProtocol:class {
    func getDecodeData(data:@escaping([CountryResponseModel]) -> Void)
}


class CountryTableViewViewModel:CountryTableViewModelProtocol {
    
    let fetcher = DataFetcher.init(network: NetworkService())
    
    func getDecodeData(data:@escaping([CountryResponseModel]) -> Void)  {
            self.fetcher.getDataFromRequest { (response) in
                data(response)
            }
    }
    
    
}
