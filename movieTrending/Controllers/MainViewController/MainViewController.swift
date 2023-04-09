//
//  MainViewController.swift
//  movieTrending following MVVM pattern
//
//  Created by BS1095 on 5/4/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //variables
    var cellDataSource: [Movie] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView(){
        self.title = "Main View okay?"
        self.view.backgroundColor = .blue
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    
    //All Bindings
    func bindViewModel(){
        
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if(isLoading){               //activity indicator will show at loading time
                    self.activityIndicator.startAnimating()
                }
                else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }

}
