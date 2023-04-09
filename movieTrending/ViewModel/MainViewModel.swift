//
//  MainViewModel.swift
//  movieTrending
//
//  Created by BS1095 on 5/4/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numOfSec() -> Int{
        1
    }
    
    func numOfRow(in section: Int) -> Int{
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        
        if (isLoading.value ?? true){
            return
        }
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in   //avoid retain cycle
            
            self?.isLoading.value = false   //when data arrived
            
            switch result {
                case .success(let data):
                    print("Top Trending Counts: \(data.results.count)")
                    self?.dataSource = data
                    self?.mapCellData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
