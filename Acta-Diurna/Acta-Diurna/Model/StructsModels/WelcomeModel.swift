//
//  WelcomeModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//

import Foundation
// MARK: - Welcome
struct Welcome: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
