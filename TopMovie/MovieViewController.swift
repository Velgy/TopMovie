//
//  ViewController.swift
//  TopMovie
//
//  Created by Valentin on 16.06.2021.
//

import UIKit

class MovieViewController: UIViewController {
    
    var response: Response?
    var service = Service()
    
    private var mainView: MovieView {
        return view as! MovieView
    }
    
    override func loadView() {
        view = MovieView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        navigationItem.title = "Top Movie"
        doSome()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func doSome() {
        service.requestApi { result in
            self.response = result
            self.mainView.collectionView.reloadData()
        }
    }
    
    func convertDateFormater(_ date: String?) -> String {
            var fixDate = ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let originalDate = date {
                if let newDate = dateFormatter.date(from: originalDate) {
                    dateFormatter.dateFormat = "dd.MM.yyyy"
                    fixDate = dateFormatter.string(from: newDate)
                }
            }
            return fixDate
        }

}


extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    struct Const {
        static let leftOffset: CGFloat = 10
        static let rightOffset: CGFloat = 10
        static let spacing: CGFloat = 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - Const.leftOffset - Const.rightOffset
        return CGSize(width: width, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.spacing
    }
}


extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return response?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        
        if let photo = response?.results[indexPath.row].posterPath {
            cell.imageView.downloaded(from: "https://image.tmdb.org/t/p/w300\(photo)")
        }
        cell.titleLabel.text = response?.results[indexPath.row].title
        if let voteTitle = response?.results[indexPath.row].voteAverage {
            cell.titleVote.text = "⭐️\(voteTitle)"
        }
        if let date = response?.results[indexPath.row].releaseDate {
            cell.dataTitle.text = convertDateFormater(date)
        }
        
        return cell
    }
    
}


extension MovieViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewController = InfoViewController()
        let title = response?.results[indexPath.row].title
        viewController.nameMovie = title
        let overview = response?.results[indexPath.row].overview
        viewController.overview = overview
        let voteAverage = response?.results[indexPath.row].voteAverage
        viewController.average = voteAverage
        let releaseDate = response?.results[indexPath.row].releaseDate
        viewController.releaseDate = convertDateFormater(releaseDate)
        let url = response?.results[indexPath.row].posterPath
        viewController.urlImage = url
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}




