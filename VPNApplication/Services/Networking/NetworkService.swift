//
//  NetworkService.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import UIKit

protocol NetworkRequestProtocol {
    func request(completion:@escaping((Data?,Error?) -> Void))
}

class NetworkService:NetworkRequestProtocol {
    
    fileprivate let stringUrl = "https://restcountries.eu/rest/v2/all"
    
    func request(completion: @escaping ((Data?, Error?) -> Void)) {
        guard let url = URL(string: stringUrl) else { return }
        let request = URLRequest(url: url)
        
        let task = dataTask(request: request, completion: completion)
        task.resume()
    }
    
    private func dataTask(request:URLRequest, completion:@escaping(Data?,Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }
}
