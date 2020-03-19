//
//  MoviesReducer.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUIFlux

func moviesStateReducer(state: MoviesState, action: Action) -> MoviesState {
    var state = state
    switch action {
    case let action as MoviesActions.SetPopular:
        state = mergeMovies(movies: action.response.results, state: state)
        //state.movies += action.response.results
    default:
        break
    }
    
    
    return state
}

private func mergeMovies(movies: [Movie], state: MoviesState) -> MoviesState {
    var state = state
    for movie in movies {
        state.movies[movie.id] = movie
        //if state.movies[movie.id] == nil {
        //    state.movies[movie.id] = movie
        //}
    }
    return state
}

func +=(lhs: inout [Int: Movie], rhs: [Movie]) {
    for movie in rhs {
        lhs[movie.id] = movie
    }
}
