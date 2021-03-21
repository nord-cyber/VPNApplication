//
//  DataFetcher.swift
//  VPNApplication
//
//  Created by Vadzim Ivanchanka on 21.03.21.
//

import Foundation
import UIKit

protocol GetDataFromRequest {
    func getDataFromRequest(response:@escaping(([CountryResponseModel]) -> Void))
}

class DataFetcher: GetDataFromRequest{
    
    var networkRequest:NetworkService?
    
    init(network:NetworkService) {
        networkRequest = network
    }
    
    func getDataFromRequest(response: @escaping (([CountryResponseModel]) -> Void)) {
        networkRequest?.request(completion: { [self] (data, error) in
            if let error = error {
                // error handling
                print(error.localizedDescription)
            }
            guard let decoded = decoderJSON(type: [CountryResponseModel].self, from: data) else { return }
            response(decoded)
        })
    }
    
    private func decoderJSON<T:Decodable>(type:T.Type, from:Data?) -> T? {
        guard let data = from , let decoded = try? JSONDecoder().decode(type.self, from: data ) else { return nil}
        return decoded
    }
    
    
    private func downloadImage(url:String) -> UIImage? {
        print(url)
        guard let url = URL(string: url) else { return nil }
        var image:UIImage?
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            image = UIImage(data: data)
            
        }
        task.resume()
        return image
    }
}
