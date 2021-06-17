//
//  InfoViewController.swift
//  TopMovie
//
//  Created by Valentin on 17.06.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var releaseDate: String?
    var overview: String?
    var urlImage: String?
    var average: Double?
    var nameMovie: String?
    
    private var mainView: InfoView {
        return view as! InfoView
    }
    
    override func loadView() {
        view = InfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.imageView.downloaded(from: "https://image.tmdb.org/t/p/w300\(urlImage ?? "nil")" )
        mainView.titleAverage.text = "⭐️\(average ?? 0.0)"
        mainView.titleDate.text = releaseDate
        mainView.titleOverview.text = overview
        navigationItem.title = nameMovie
    }
    
}
