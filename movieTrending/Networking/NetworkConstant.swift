//
//  NetworkConstant.swift
//  movieTrending
//
//  Created by BS1095 on 6/4/23.
//

import Foundation

class NetworkConstant {
    
    public static var shared : NetworkConstant = NetworkConstant()
    
    private init(){
        //singleton
    }
    
    public var apiKey: String {
        get {                //api key from themoviedb.org
            return "110ef0e042852cde9a3753a6b583baaa"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
