//
//  ArticleModel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 16/05/24.
//

import Foundation
import UIKit
// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    var publishedAt: String?
    let content: String?
}
