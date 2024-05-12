//
//  HomeViewController.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit

class HomeViewController:  UIViewController{
    
    // MARK: - Properties
   
    var viewModel: HomeViewModel?
    
    private lazy var homeView : HomeView = {
        return HomeView()
    }()

    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()
        self.view =  homeView

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
  
    init(viewModel: HomeViewModel){
        super.init (nibName: nil, bundle: nil)
       
        self.viewModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
