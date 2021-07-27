//
//  ResultState.swift
//  NewsApp
//
//  Created by raymundo melecio on 7/25/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content:[Article])
    case failed(error: Error)
    
}
