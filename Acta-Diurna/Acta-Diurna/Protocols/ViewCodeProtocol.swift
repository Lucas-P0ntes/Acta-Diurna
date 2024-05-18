//
//  ViewCodeProtocol.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 12/05/24.
//

import Foundation
public protocol ViewCodeProtocol {
    
    // Constrói a hierarquia de views.
    func buildViewHierarchy()
    
    // Configura as constraints de layout das vistas.
    func setupConstraints()
    
    // Configura propriedades e comportamentos das views (opcional).
    func configureViews()
}

// Extensão que fornece uma implementação padrão para simplificar a configuração de views.
public extension ViewCodeProtocol {
    
    // Método que chama os métodos de configuração em sequência.
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    // Método de configuração de views vazio (pode ser implementado se necessário).
    func configureViews() {
        
    }
}
