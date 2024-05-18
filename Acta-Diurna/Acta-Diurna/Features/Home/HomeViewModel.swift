
//
//  HomeViewModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//
import Foundation

class HomeViewModel {
    private let coreDataManager = CoreDataManager.shared

    init(){
        print(fetchAllArticleSaves())
    }
    
    func fetchArticles() async throws -> [Article] {
        do {
                  let articles = try await NewsAPIManager.shared.fetchNews()
            
                  return articles.map { article in
                      var formattedArticle = article
                      if let isoDateString = article.publishedAt {
                          let isoDateFormatter = ISO8601DateFormatter()
                          if let date = isoDateFormatter.date(from: isoDateString) {
                              let dateFormatter = DateFormatter()
                              dateFormatter.dateFormat = "dd.MM.yyyy"
                              let formattedDate = dateFormatter.string(from: date)
                              formattedArticle.publishedAt = formattedDate
                          }
                      }
                      return formattedArticle
                  }
              } catch {
                  throw error
              }
          }
    
    func fetchAllArticleSaves() -> [ArticleSave] {
        return coreDataManager.fetchAllArticleSaves(searchText: "")
    }
      }
