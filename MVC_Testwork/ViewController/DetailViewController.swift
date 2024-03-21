//
//  DetailViewController.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var movieImage = UIImageView()
    var titleLbl = UILabel()
    var ganreLbl = UILabel()
    var yearLbl = UILabel()
    var ratingLbl = UILabel()
    var directorLbl = UILabel()
    var actorsLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createAddsubviews()
        addSubviews()
        makeConstrants()
    }
}

extension DetailViewController {
    
    func createAddsubviews() {
        movieImage.layer.masksToBounds = true
        movieImage.contentMode = .scaleAspectFill
        
        titleLbl.textColor = .black
        titleLbl.textAlignment = .center
        titleLbl.font = .systemFont(ofSize: 20, weight: .bold)
        
        directorLbl.textColor = .darkGray
        directorLbl.textAlignment = .left
        directorLbl.numberOfLines = 0
        directorLbl.font = .systemFont(ofSize: 14, weight: .light)
        
        actorsLbl.textColor = .darkGray
        actorsLbl.textAlignment = .left
        actorsLbl.numberOfLines = 0
        actorsLbl.font = .systemFont(ofSize: 14, weight: .light)
        
        ganreLbl.textColor = .darkGray
        ganreLbl.textAlignment = .left
        ganreLbl.font = .systemFont(ofSize: 14, weight: .light)
        
        yearLbl.textColor = .darkGray
        yearLbl.textAlignment = .left
        yearLbl.font = .systemFont(ofSize: 14, weight: .light)
        
        ratingLbl.textColor = .red
        ratingLbl.textAlignment = .right
        ratingLbl.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    func addSubviews() {
        [movieImage, titleLbl, directorLbl, actorsLbl, ganreLbl, yearLbl, ratingLbl].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstrants() {
        movieImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        ganreLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        yearLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(15)
        }
        
        ratingLbl.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(10)
        }
        
        directorLbl.snp.makeConstraints { make in
            make.top.equalTo(ganreLbl.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        actorsLbl.snp.makeConstraints { make in
            make.top.equalTo(directorLbl.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(15)
        }
    }
}
