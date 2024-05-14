//
//  DetailsView.swift
//  Acta-Diurna
//
//  Created by Lucas Pontes on 11/05/24.
//
import UIKit

class DetailsView: UIView {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "wallpaper")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = screenWidth - 20
        label.text = "The New Hot Handset Is a Cute and Transparent Dumb Phone You Can't Buy"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    let autoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = screenWidth - 20

        label.text =  "Julian Chokkattu"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let publishedAtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = screenWidth - 20

        label.text = "2024-04-16"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
      

        label.text = "The company HMD, known for making Nokia phones, has partnered with Heineken and Bodega on “The Boring Phone” and there will only be 5,000 of them."
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageViewArtigo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = screenWidth - 20

        label.text = "The company HMD, known for making Nokia phones, has partnered with Heineken and Bodega on “The Boring Phone” and there will only be 5,000 of them."
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(named: "BrancoAzulado")
        setupView()
    }
    
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}

extension DetailsView {
    private func buildViewHierarchy() {
        addSubview(scrollView)
        
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(autoresLabel)
        scrollView.addSubview(publishedAtLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(imageViewArtigo)
        scrollView.addSubview(contentLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
               scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
               scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
               scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
               
               imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
               imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
               imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
               imageView.widthAnchor.constraint(equalToConstant: 100),

               imageView.heightAnchor.constraint(equalToConstant: 355),
               
               titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
               titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
               
               autoresLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               autoresLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
               autoresLabel.trailingAnchor.constraint(equalTo: publishedAtLabel.leadingAnchor, constant: -8),
               
               publishedAtLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               publishedAtLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
               
               descriptionLabel.topAnchor.constraint(equalTo: autoresLabel.bottomAnchor, constant: 20),
               descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
               descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
               
               imageViewArtigo.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
               imageViewArtigo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
               imageViewArtigo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
               imageViewArtigo.widthAnchor.constraint(equalToConstant: 100),
               imageViewArtigo.heightAnchor.constraint(equalToConstant: 166),
               
               contentLabel.topAnchor.constraint(equalTo: imageViewArtigo.bottomAnchor, constant: 20),
               contentLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
               contentLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
               contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
           ])
    }
}
