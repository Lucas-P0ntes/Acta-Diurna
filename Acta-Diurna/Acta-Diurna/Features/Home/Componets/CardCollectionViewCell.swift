//
//  CardCollectionViewCell.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 12/05/24.
//

import UIKit
class CardCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.text = "The New Hot Handset Is a Cute and Transparent Dumb Phone You Can't Buy"
        label.font = UIFont.systemFont(ofSize: 13)
        // label.font = UIFont(name: "InclusiveSans-Regular", size: 10)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "The company HMD, known for making Nokia phones, has partnered with Heineken and Bodega on “The Boring Phone” and there will only be 5,000 of them."
        label.font = UIFont.systemFont(ofSize: 7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let autoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.clipsToBounds = true
        label.numberOfLines = 0
        let prefix = "Autor: "
        label.text = prefix + "Julian Chokkattu"
        label.font = UIFont.systemFont(ofSize: 10)
        // label.font = UIFont(name: "InclusiveSans-Regular", size: 7)
        return label
    }()

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCollectionViewCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(autoresLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 240),
            widthAnchor.constraint(equalToConstant: 200),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor), // Alterado para trailingAnchor
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            autoresLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            autoresLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),

        
        ])
    }
}

#Preview{
    CardCollectionViewCell()
}
