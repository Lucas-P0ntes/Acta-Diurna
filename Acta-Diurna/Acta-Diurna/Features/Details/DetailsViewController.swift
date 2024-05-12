//
//  DetailsViewController.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit

class DetailsViewController: UIViewController{
    
    // MARK: - Properties
    
    var viewModel: DetailsViewModel?
    
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
        
    }
    
    init(viewModel: DetailsViewModel){
        super.init (nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
