//
//  DetailsViewController.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit

class DetailsViewController: UIViewController, UIScrollViewDelegate{
    
    // MARK: - Properties
    var coordinator: CoordinatorFlowController?
    var viewModel: DetailsViewModel?
    var article: Article

    var scrollView: UIScrollView!
    
    private lazy var detailsView : DetailsView = {
        return DetailsView()
    }()
    
    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()
        self.view =  detailsView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsView.scrollView.delegate = self
        detailsView.configure(with: article)
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
            navigationItem.rightBarButtonItem = saveButton

    }
    
    init(viewModel: DetailsViewModel,article: Article){
        self.article = article
        super.init (nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func saveButtonTapped() {
        viewModel?.saveArtigo(artigo: ArticleSaveModel(
            id: UUID(),
           author: article.author ?? "",
           title: article.title ?? "",
           descriptionText: article.description ?? "",
           url: article.url ?? "",
           urlToImage: article.urlToImage ?? "",
           publishedAt: article.publishedAt ?? "",
           content: article.content ?? "")
        )
        
    }
}
