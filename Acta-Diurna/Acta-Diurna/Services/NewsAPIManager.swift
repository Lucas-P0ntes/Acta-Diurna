//
//  NewsAPIManager.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 14/05/24.
//



import Foundation

@MainActor
class NewsAPIManager {
    static let shared = NewsAPIManager()
    
    private let baseURL = "https://newsapi.org/v2/"
    private let apiKey = "\(ApiKeyNews.apiKeyNews)" // Add your NewsAPI key here
    
    func fetchNews() async throws -> [Article] {
        let path = "top-headlines?country=us"
        let urlString = baseURL + path
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(Welcome.self, from: data)
            
            if !responseData.articles.isEmpty {
                
                return responseData.articles
            } else {
                throw APIError.invalidData
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
