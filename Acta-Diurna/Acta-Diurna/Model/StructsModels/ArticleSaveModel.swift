//
//  SaveArticleModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//

import Foundation

struct ArticleSaveModel{
    let id: UUID
    let author: String
    let title: String
    let descriptionText: String
    let url: String
    let urlToImage: String
    var publishedAt: String
    let content: String
}
