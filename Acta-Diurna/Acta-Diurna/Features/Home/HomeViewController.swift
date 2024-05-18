//
//  HomeViewController.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit
class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var coordinator: CoordinatorFlowController?
    var viewModel: HomeViewModel?
    
    private lazy var homeView: HomeView = {
        return HomeView()
    }()
    
    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            
        Task {
           let articles =  try await viewModel?.fetchArticles() ?? []
            self.homeView.fetchArticles(articles: articles)
        }
        
        self.homeView.fetchArticlesSaves(articlesSaves: viewModel?.fetchAllArticleSaves() ?? [])
        
    }
    
    
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        homeView.delegateFlow = self
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomeFlowDelegate {
    func goToDetails(artigo: Article) {
        coordinator?.goToDetails(artigo: artigo)

    }
    
}


