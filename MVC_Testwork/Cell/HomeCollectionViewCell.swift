//
//  HomeCollectionViewCell.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    let posterImage = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        addViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionViewCell {
    
    func createViews() {
        posterImage.layer.cornerRadius = 20
        posterImage.layer.masksToBounds = true
        posterImage.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    func addViews() {
        [posterImage, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func makeConstraints() {
        posterImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(5)
            make.width.equalTo(160)
            make.height.equalTo(180)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).inset(5)
            make.left.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(5)
        }
    }
    
    func movieConfigureUI(movie: Movie) {
        self.posterImage.loadImage(from: movie.poster)
        self.titleLabel.text = movie.title
    }
}
