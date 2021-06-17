//
//  CollectionViewCell.swift
//  TopMovie
//
//  Created by Valentin on 17.06.2021.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 13
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    let titleVote: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let dataTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(titleVote)
        addSubview(dataTitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10.0)
            make.top.equalToSuperview().offset(10.0)
            make.bottom.equalToSuperview().offset(-10.0)
            make.width.equalTo(60.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalTo(imageView.snp.right).offset(20.0)
            make.right.equalToSuperview().offset(-10.0)
        }
        
        titleVote.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10.0)
            make.right.equalToSuperview().offset(-10.0)
        }
        
        dataTitle.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10.0)
            make.left.equalTo(imageView.snp.right).offset(20.0)
        }
        
    }
}
