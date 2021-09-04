//
//  RequestApiError.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 02/09/21.
//

import Foundation

enum RequestApiError: Error {
    case genericError
    case invalidURL
    case noData
    case invalidResponse
    case wrongStatusCode
    case invalidRequest
    case tokenGenerationError
}
