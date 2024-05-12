//
//  HomeView.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit

class HomeView: UIView {
    var navigationController: UINavigationController?

    
    // Adiciona um botão que irá navegar para outra página
    private lazy var nextPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próxima Página", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
        return button
    }()

   

    // Layout do botão na view
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .green
        addSubview(nextPageButton)
        nextPageButton.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
    }
    
    
    @objc private func navigateToNextPage() {
        
           guard let navigationController = navigationController else {
               print("Erro: UINavigationController não definida.")
               return
           }
           
           let nextViewController = DetailsViewController(viewModel: DetailsViewModel())
           navigationController.pushViewController(nextViewController, animated: true)
       }

}
