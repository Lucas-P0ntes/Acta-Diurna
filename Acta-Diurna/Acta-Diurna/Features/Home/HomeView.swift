//
//  HomeView.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//

import UIKit

class HomeView: UIView {
    
    weak var delegateFlow: HomeFlowDelegate?

    
    // Adiciona um botão que irá navegar para outra página
    private lazy var nextPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próxima Página", for: .normal)
        button.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()

   

    // Layout do botão na view
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .green
        addSubview(nextPageButton)
        nextPageButton.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.width/2, width: 200, height: 50)
    }
    
    
    @objc private func navigateToNextPage() {
        delegateFlow?.goToDetails()
       }

}
