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
        label.text = "The New Hot Handset Is a Cute and Transparent Dumb Phone You Can't Buy"
        label.font = UIFont(name: "PlayfairDisplay-Bold", size: 25.0)
        return label
    }()
    
    let autoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text =  "Julian Chokkattu"
        label.font = UIFont(name: "PlayfairDisplay-Medium", size: 15.0)
        return label
    }()
    
    let publishedAtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "2024-04-16"
        label.font = UIFont(name: "PlayfairDisplay-Medium", size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "The company HMD, known for making Nokia phones, has partnered with Heineken and Bodega on “The Boring Phone” and there will only be 5,000 of them."
        label.font = UIFont(name: "PlayfairDisplay-Medium", size: 15.0)
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
        label.text = "The company HMD, known for making Nokia phones, has partnered with Heineken and Bodega on “The Boring Phone” and there will only be 5,000 of them."
        label.font = UIFont(name: "PlayfairDisplay-Medium", size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageURL: URL? {
        didSet {
            guard let url = imageURL else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self?.imageViewArtigo.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(named: "BrancoAzulado")
        setupView()
    }
    
    func configure(with article: Article?) {
        guard let article = article else { return }
        titleLabel.text = article.title
        autoresLabel.text = article.author
        publishedAtLabel.text = article.publishedAt
        descriptionLabel.text = article.description
        imageURL =  URL(string: article.urlToImage ?? "" )
    }
    
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
    
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
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageView.heightAnchor.constraint(equalToConstant: 355),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
            
            autoresLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            autoresLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            autoresLabel.trailingAnchor.constraint(equalTo: publishedAtLabel.leadingAnchor, constant: -15),
            
            publishedAtLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            publishedAtLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            descriptionLabel.topAnchor.constraint(equalTo: autoresLabel.bottomAnchor, constant: 30),
            descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            
            imageViewArtigo.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            imageViewArtigo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            imageViewArtigo.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            imageViewArtigo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageViewArtigo.widthAnchor.constraint(equalToConstant: 317),
            imageViewArtigo.heightAnchor.constraint(equalToConstant: 166),
            
            contentLabel.topAnchor.constraint(equalTo: imageViewArtigo.bottomAnchor, constant: 30),
            contentLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
    }
}
