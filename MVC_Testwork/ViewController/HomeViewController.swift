//
//  HomeViewController.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavBarItem()
        createView()
        addView()
        makeConstraints()
        fetchMovie()
    }
}

private extension HomeViewController {
    
    func createNavBarItem() {
        self.navigationItem.title = "Movies"
    }
    
    func createView() {
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    func addView() {
        view.addSubview(homeCollectionView)
    }
    
    func makeConstraints() {
        homeCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func fetchMovie() {
        ApiManager.shared.apiRequest(url: Constants.movieURL, expecting: [Movie].self) { [ weak self] result in
            switch result {
            case .success(let newMovie):
                DispatchQueue.main.async {
                    self?.movies = newMovie
                    self?.homeCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error viewModel: \(error)")
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        if let movieContent = movies.safeObject(at: indexPath.row) {
            cell.movieConfigureUI(movie: movieContent)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 15) / 2
        
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieList = movies[indexPath.row]
        let detailVC = DetailViewController()
        
        ApiManager.shared.fetchDetailedData(movieId: movieList.id, url: Constants.movieURL, expecting: [Movie].self) { [ weak self] result in
            switch result {
            case .success(let newMovie):
                let image = movieList.poster
                let attributedTitle = movieList.title
                let attributedGanre = movieList.genre
                let attributedYear = movieList.year
                let attributedRating = movieList.rating
                let attributedDirector = movieList.director
                let attributedActors = movieList.actors
                
                DispatchQueue.main.async {
                    detailVC.movieImage.loadImage(from: image)
                    detailVC.titleLbl.text = attributedTitle
                    detailVC.ganreLbl.text = attributedGanre.joined(separator: ", ")
                    detailVC.yearLbl.text = "\(attributedYear)"
                    detailVC.ratingLbl.text = "\(attributedRating)"
                    detailVC.directorLbl.text = attributedDirector
                    detailVC.actorsLbl.text = attributedActors.joined(separator: ", ")
                }
                
                DispatchQueue.main.async {
                    self?.movies = newMovie
                }
            case .failure(let error):
                print("Error viewModel: \(error)")
            }
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
