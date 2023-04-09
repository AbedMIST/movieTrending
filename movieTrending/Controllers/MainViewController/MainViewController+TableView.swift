//
//  MainViewController+TableView.swift
//  movieTrending
//
//  Created by BS1095 on 5/4/23.
//

import Foundation
import UIKit

//Extention of mainviewcontroller
extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    
    func registerCells(){
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numOfSec()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //cell.textLabel?.text = "\(indexPath.row)"
        let movieData = cellDataSource[indexPath.row]
        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        
        return cell
    }
    
    
}
