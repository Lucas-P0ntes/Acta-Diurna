//
//  ArticleSave.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//
import Foundation
import CoreData

extension CoreDataManager {
    
    func saveArticle(articleSave: ArticleSaveModel) {
        let context = persistentContainer.viewContext

        
        let newArticleSave = ArticleSave(context:context)
           // Assign values from ArticleSaveModel to newArticleSave properties
            newArticleSave.id = UUID()
            newArticleSave.title = articleSave.title
            newArticleSave.author = articleSave.author
            newArticleSave.publishedAt = articleSave.publishedAt
            newArticleSave.descriptionText = articleSave.descriptionText
            newArticleSave.urlToImage = articleSave.urlToImage
            newArticleSave.url = articleSave.url
       
        
        saveContext()
    }
    
    func fetchAllArticleSaves(searchText: String = "") -> [ArticleSave] {
        let fetchRequest: NSFetchRequest<ArticleSave> = ArticleSave.fetchRequest()
        
        if !searchText.isEmpty {
            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            fetchRequest.predicate = predicate
        }
        
        do {
            let articleSaves = try persistentContainer.viewContext.fetch(fetchRequest)
            return articleSaves
        } catch {
            print("Error fetching ArticleSaves: \(error.localizedDescription)")
            return []
        }
    }

    
    func deleteArticleSave(articleSave: ArticleSaveModel) {
        if let articleSave = fetchArticleByID(id: articleSave.id) {
            persistentContainer.viewContext.delete(articleSave)
            saveContext()
        }
    }
    
    func fetchArticleByID(id: UUID) -> ArticleSave? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ArticleSave> = ArticleSave.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let articleSaves = try context.fetch(fetchRequest)
            return articleSaves.first
        } catch {
            print("Error fetching ArticleSave: \(error)")
            return nil
        }
    }
}
