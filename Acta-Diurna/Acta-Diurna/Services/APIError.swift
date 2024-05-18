//
//  APIError.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidData
}
