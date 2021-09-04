//
//  EveryTenthRepository.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 03/09/21.
//

import Foundation

class EveryTenthRepository: EveryTenthRequestable {
    func fetchEveryTenthCharacter(completion: @escaping (Result<String,RequestApiError>) -> Void) {
        let urlString = AppConfiguration.apiBaseUrl
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print( "Error Fetching data from server")
                completion(.failure(.genericError))
                return
            }
            
            guard let data = data else {
                print( "No Data available")
                completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print( "No Response")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard response.statusCode == 200 else {
                print( "Wrong Status Code")
                completion(.failure(.wrongStatusCode))
                return
            }
            var stx = ""
            let dataString = String(decoding: data, as: UTF8.self)
            let endIndex = dataString.endIndex
            var index: String.Index? = dataString.startIndex
            //let tenthChar = String(dataString[index])
            while index != nil {
                let tenthChar = String(dataString[index!])
                stx = "\(stx)\(tenthChar)"
                index = dataString.index(index!, offsetBy: 10, limitedBy: endIndex)
            }
            completion(.success(stx))
        }.resume()
    }
}
