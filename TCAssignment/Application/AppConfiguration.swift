//
//  AppConfiguration.swift
//  TCAssignment
//
//  Created by Prabhdeep Singh on 04/09/21.
//

import Foundation

final class AppConfiguration {
    static var apiBaseUrl: String = {
        guard let apiBaseUrl = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiBaseUrl
    }()
}
