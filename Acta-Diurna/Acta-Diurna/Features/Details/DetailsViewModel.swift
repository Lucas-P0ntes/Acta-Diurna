//
//  DetailsViewModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import Foundation

class DetailsViewModel {
    private let coreDataManager = CoreDataManager.shared

    func saveArtigo(artigo: ArticleSaveModel){
        coreDataManager.saveArticle(articleSave: artigo)

        
    }
  
}
