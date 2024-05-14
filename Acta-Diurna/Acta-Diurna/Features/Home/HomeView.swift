import UIKit


class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegateFlow: HomeFlowDelegate?
    
    var title = CustomTextLabel(sizeType: .size40, textType: .bold, colorType: .black, labelText: "Notícias e blogs")
    var categoryTopArticles = CustomTextLabel(sizeType: .size15, textType: .bold, colorType: .black, labelText: "Top Artigos:")
    var categoryYourArticlesFavorites = CustomTextLabel(sizeType: .size15, textType: .bold, colorType: .black, labelText: "Seus artigos salvos:")
    
    var articles: [Article] = [] // Adicione esta propriedade
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return  articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding: CGFloat = 10 // Ajuste conforme necessário
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        let article = articles[indexPath.item]
        cell.titleLabel.text = article.title
        cell.autoresLabel.text = article.author
        cell.descriptionLabel.text = article.description
        
        cell.imageURL = URL(string: article.urlToImage ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateFlow?.goToDetails()
    }
    
    func fetchArticles(articles: [Article]) {
        
        self.articles = articles
        
        topArticlesCollectionView.reloadData()
        yourArticlesFavoritesCollectionView.reloadData()
        
       
    }
}

extension HomeView: ViewCodeProtocol{
    func buildViewHierarchy() {
        
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
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            categoryTopArticles.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 40),
            categoryTopArticles.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            topArticlesCollectionView.topAnchor.constraint(equalTo: categoryTopArticles.bottomAnchor, constant: 20),
            topArticlesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topArticlesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topArticlesCollectionView.heightAnchor.constraint(equalToConstant: 240),
            
            categoryYourArticlesFavorites.topAnchor.constraint(equalTo: topArticlesCollectionView.bottomAnchor, constant: 40),
            categoryYourArticlesFavorites.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            yourArticlesFavoritesCollectionView.topAnchor.constraint(equalTo: categoryYourArticlesFavorites.bottomAnchor, constant: 20),
            yourArticlesFavoritesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yourArticlesFavoritesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yourArticlesFavoritesCollectionView.heightAnchor.constraint(equalToConstant: 240), // Defina a altura adequada conforme necessário
        ])
    }
}
