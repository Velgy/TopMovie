//
//  ViewMovie.swift
//  TopMovie
//
//  Created by Valentin on 16.06.2021.
//

import UIKit

class MovieView: UIView {
    
    var collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let view = UICollectionView(frame: frame, collectionViewLayout: layot)
        view.backgroundColor = .white
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
