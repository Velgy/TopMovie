//
//  ViewController.swift
//  TopMovie
//
//  Created by Valentin on 16.06.2021.
//

import UIKit

class MovieViewController: UIViewController {
    
    private var mainView: ViewMovie {
        return view as! ViewMovie
    }
    
    override func loadView() {
        view = ViewMovie()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .red
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
        return CGSize(width: width, height: width)
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        
        return cell
    }
    
}


extension MovieViewController: UICollectionViewDelegate {
    
}



class CollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 13
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.frame
    }
    
}
