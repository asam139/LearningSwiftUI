//
//  ContentView.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct ContentView: ConnectedView {
    @EnvironmentObject private var store: Store<AppState>
    struct Props {
        var movies: [Movie] = []
    }


    // MARK: Computed Props
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        let movies = Array(state.moviesState.movies.values)
        return Props(movies: movies)
    }

    // MARK: - Fetch

    func fetchPopular() {
        store.dispatch(action: MoviesActions.FetchPopular())
    }

    func body(props: Props) -> some View {
        ZStack {
            List(props.movies) { movie in
                Text(movie.title)
            }.onAppear {
                self.fetchPopular()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
