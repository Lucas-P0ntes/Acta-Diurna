//
//  CustomTextLabel.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 12/05/24.
//

import UIKit

class CustomTextLabel: UIView {

    
    private let sizeType: CustomTextSizeType
    private let textType: CustomTextFontType
    private let colorType: CustomTextColorType

    enum CustomTextSizeType: Int {
        case size5 = 5
        case size10 = 10
        case size15 = 15
        case size40 = 40
    }

    enum CustomTextFontType: Int {
        case regular
        case semibold
        case bold
        case black
    }
    
    enum CustomTextColorType: Int {
        case white
        case gray
        case black

    }

    private var textSize: CGFloat {
        switch sizeType {
        case .size5: return 5
        case .size10: return 10
        case .size15: return 15
        case .size40: return 40
        }
    }
    private var textFont: UIFont {
        switch textType {
        case .regular: return UIFont(name: "PlayfairDisplay-Medium", size: textSize) ?? .systemFont(ofSize: textSize, weight: .regular)
            
        case .semibold: return UIFont(name: "PlayfairDisplay-Medium", size: textSize) ?? .systemFont(ofSize: textSize, weight: .semibold)
            
            
        case .bold: return UIFont(name: "PlayfairDisplay-Bold", size: textSize) ?? .systemFont(ofSize: textSize, weight: .bold)
        
    case .black: return UIFont(name: "PlayfairDisplay-Black", size: textSize) ?? .systemFont(ofSize: textSize, weight: .bold)
    }
    }
    private var textColor: UIColor {
        switch colorType {
        case .white: return .white
        case .gray: return .gray
        case .black: return .black // Defina a cor roxa conforme necessário
        }
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    init(sizeType: CustomTextSizeType, textType: CustomTextFontType, colorType: CustomTextColorType, labelText: String) {
        self.sizeType = sizeType
        self.textType = textType
        self.colorType = colorType
        super.init(frame: .zero)
        setupLabel(with: labelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(with text: String) {
        titleLabel.text = text
        titleLabel.font = textFont
        titleLabel.textColor = textColor
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
