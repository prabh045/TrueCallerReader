//
//  File.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 04/09/21.
//

import Foundation

protocol TenthCharRequestable {
    func fetchTenthCharacter(completion: @escaping (Result<String,RequestApiError>) -> Void)
}

protocol EveryTenthRequestable {
    func fetchEveryTenthCharacter(completion: @escaping (Result<String,RequestApiError>) -> Void)
}

protocol WordCountable {
    func fetchWordCount(completion: @escaping (Result<Int,RequestApiError>) -> Void)
}
