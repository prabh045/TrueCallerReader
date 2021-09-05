//
//  CharacterRequestRepository.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 02/09/21.
//

import Foundation

class TenthCharRequestRepository: TenthCharRequestable {
    func fetchTenthCharacter(completion: @escaping (Result<String,RequestApiError>) -> Void) {
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
            
            let dataString = String(decoding: data, as: UTF8.self)
            let index = dataString.index(dataString.startIndex, offsetBy: 10)
            let tenthChar = String(dataString[index])
            completion(.success(tenthChar))
        }.resume()
    }
}
