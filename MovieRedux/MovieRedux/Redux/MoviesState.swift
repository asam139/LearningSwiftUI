//
//  MoviesState.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct MoviesState: FluxState, Codable {
    var movies: [Int: Movie] = [:]
    
    enum CodingKeys: String, CodingKey {
        case movies
    }
}
