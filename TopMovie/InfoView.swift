//
//  InfoView.swift
//  TopMovie
//
//  Created by Valentin on 17.06.2021.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
    
    let titleOverview: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 12
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let titleAverage: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let titleDate: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleDate)
        addSubview(titleAverage)
        addSubview(titleOverview)
        addSubview(imageView)
        setContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(10.0)
            make.centerX.equalToSuperview()
        }
   
        titleOverview.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20.0)
            make.left.equalToSuperview().offset(10.0)
            make.right.equalToSuperview().offset(-10.0)
        }
        
        titleAverage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20.0)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10.0)
        }
        
        titleDate.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20.0)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10.0)
        }
        
    }
}
