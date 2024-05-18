//
//  CoordinatorFlowController.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 12/05/24.
//

import Foundation
import UIKit

class CoordinatorFlowController{
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
 
     func start() -> UIViewController {
         let homeViewController =  HomeViewController(viewModel: HomeViewModel())
         homeViewController.coordinator = self
         navigationController = UINavigationController(rootViewController: homeViewController)
         return navigationController
     }
    
   
}

extension CoordinatorFlowController: HomeFlowDelegate{
    func goToDetails(artigo: Article) {
        let ViewController =  DetailsViewController(viewModel: DetailsViewModel(), article: artigo)
        ViewController.coordinator = self
        navigationController.pushViewController(ViewController , animated: true)
    }
    
 
}
