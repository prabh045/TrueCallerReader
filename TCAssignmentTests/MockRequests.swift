//
//  TenthCharRepoMock.swift
//  TCAssignmentTests
//
//  Created by Prabhdeep Singh on 05/09/21.
//

import Foundation
@testable import TCAssignment

class TenthCharRepoMock: TenthCharRequestable {
    var didCallRequest = false
    var completion: ((Result<String, RequestApiError>) -> Void)?
    func fetchTenthCharacter(completion: @escaping (Result<String, RequestApiError>) -> Void) {
        didCallRequest = true
        self.completion = completion
    }
    
    func mockSuccessResponse() {
        completion?(.success("T"))
    }
    
    func mockFailureResponse() {
        completion?(.failure(.genericError))
    }
}

class EveryTenthCharRepoMock: EveryTenthRequestable {
    var didCallRequest = false
    func fetchEveryTenthCharacter(completion: @escaping (Result<String, RequestApiError>) -> Void) {
        didCallRequest = true
    }
}

class WordCountRepoMock: WordCountable {
    var didCallRequest = false
    func fetchWordCount(completion: @escaping (Result<Int, RequestApiError>) -> Void) {
        didCallRequest = true
    }
}
