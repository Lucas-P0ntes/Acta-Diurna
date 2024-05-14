
//
//  HomeViewModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//
import Foundation

class HomeViewModel {
    func fetchArticles() async throws -> [Article] {
        do {
            return try await NewsAPIManager.shared.fetchNews()
        } catch {
            throw error
        }
    }
}
