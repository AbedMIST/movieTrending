//
//  Observable.swift
//  movieTrending
//
//  Created by BS1095 on 7/4/23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T? ) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping ((T?) -> Void)){
        listener(value)              //listener will update the value
        self.listener = listener
    }
}
