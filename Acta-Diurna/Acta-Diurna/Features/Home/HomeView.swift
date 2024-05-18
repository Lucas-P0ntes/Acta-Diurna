import UIKit

class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegateFlow: HomeFlowDelegate?
    var ActDiurna = CustomTextLabel(sizeType: .size15, textType: .black, colorType: .black, labelText: "Act Diurna")
    var title = CustomTextLabel(sizeType: .size40, textType: .bold, colorType: .black, labelText: "Notícias e blogs")
    var categoryTopArticles = CustomTextLabel(sizeType: .size15, textType:.black, colorType: .black, labelText: "Top Artigos:")
    var categoryYourArticlesFavorites = CustomTextLabel(sizeType: .size15, textType: .black, colorType: .black, labelText: "Seus artigos salvos:")
    
    var articles: [Article] = [] // Adicione esta propriedade
    var articlesSaves: [ArticleSave] = [] // Adicione esta propriedade
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private lazy var topArticlesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
        return collectionView
    }()
    
    private lazy var yourArticlesFavoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(named: "BrancoAzulado")
        
        setupView()
    }
  
      

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topArticlesCollectionView {
            return articles.count
        } else {
            return articlesSaves.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding: CGFloat = 10 // Ajuste conforme necessário
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        if collectionView == topArticlesCollectionView {
            let article = articles[indexPath.item]
            cell.titleLabel.text = article.title
            cell.autoresLabel.text = article.author
            cell.descriptionLabel.text = article.description
            cell.imageURL = URL(string: article.urlToImage ?? "")
        } else {
            
            let articleSave = articlesSaves[indexPath.item]
           
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == topArticlesCollectionView {
            let selectedArticle = articles[indexPath.item]
            delegateFlow?.goToDetails(artigo: selectedArticle)
        } else {
            // Handle selection of saved articles
        }
    }
    
    func fetchArticles(articles: [Article]) {
        self.articles = articles
        topArticlesCollectionView.reloadData()
    }
    
    func fetchArticlesSaves(articlesSaves: [ArticleSave]) {
        self.articlesSaves = articlesSaves
        yourArticlesFavoritesCollectionView.reloadData()
    }
}

extension HomeView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(ActDiurna)
        ActDiurna.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(categoryTopArticles)
        categoryTopArticles.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topArticlesCollectionView)
        topArticlesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(categoryYourArticlesFavorites)
        categoryYourArticlesFavorites.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(yourArticlesFavoritesCollectionView)
        yourArticlesFavoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: centerXAnchor),
            background.centerYAnchor.constraint(equalTo: centerYAnchor),
            background.heightAnchor.constraint(equalToConstant:screenHeight/2),
            background.widthAnchor.constraint(equalToConstant:screenHeight/2),
            
            ActDiurna.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            ActDiurna.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            title.topAnchor.constraint(equalTo: self.ActDiurna.bottomAnchor,constant: 50),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            categoryTopArticles.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 40),
            categoryTopArticles.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            topArticlesCollectionView.topAnchor.constraint(equalTo: categoryTopArticles.bottomAnchor, constant: 20),
            topArticlesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topArticlesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topArticlesCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            categoryYourArticlesFavorites.topAnchor.constraint(equalTo: topArticlesCollectionView.bottomAnchor, constant: 40),
            categoryYourArticlesFavorites.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            yourArticlesFavoritesCollectionView.topAnchor.constraint(equalTo: categoryYourArticlesFavorites.bottomAnchor, constant: 20),
            yourArticlesFavoritesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yourArticlesFavoritesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yourArticlesFavoritesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        // Configurações adicionais, se houver
    }
}
