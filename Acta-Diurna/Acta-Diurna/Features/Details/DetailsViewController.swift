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
    }
    
    init(viewModel: DetailsViewModel){
        super.init (nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
