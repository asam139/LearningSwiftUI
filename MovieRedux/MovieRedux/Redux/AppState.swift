//
//  AppState.swift
//  MovieRedux
//
//  Created by Saul Moreno Abril on 19/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUIFlux

fileprivate var savePath: URL!
fileprivate let encoder = JSONEncoder()
fileprivate let decoder = JSONDecoder()

struct AppState: FluxState, Codable {
    var moviesState: MoviesState

    init() {
        do {
            let icloudDirectory = FileManager.default.url(forUbiquityContainerIdentifier: nil)
            let documentDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                in: .userDomainMask,
                                                                appropriateFor: nil,
                                                                create: false)
            if let icloudDirectory = icloudDirectory {
                try FileManager.default.startDownloadingUbiquitousItem(at: icloudDirectory)
            }
            
            savePath = (icloudDirectory ?? documentDirectory).appendingPathComponent("userData")
        } catch let error {
            fatalError("Couldn't create save state data with error: \(error)")
        }
        
        if let data = try? Data(contentsOf: savePath),
            let savedState = try? decoder.decode(AppState.self, from: data) {
            self.moviesState = savedState.moviesState
        } else {
            self.moviesState = MoviesState()
        }
    }
    
    func archiveState() {
        let moviesState = self.moviesState
        DispatchQueue.global().async {
            let movies = moviesState.movies
            var savingState = self
            savingState.moviesState.movies = movies
            guard let data = try? encoder.encode(savingState) else {
                return
            }
            do {
                try data.write(to: savePath)
            } catch let error {
                print("Error while saving app state :\(error)")
            }
        }
       
    }
    
    func sizeOfArchivedState() -> String {
        do {
            let resources = try savePath.resourceValues(forKeys:[.fileSizeKey])
            let formatter = ByteCountFormatter()
            formatter.allowedUnits = .useKB
            formatter.countStyle = .file
            return formatter.string(fromByteCount: Int64(resources.fileSize ?? 0))
        } catch {
            return "0"
        }
    }
    
    #if DEBUG
    init(moviesState: MoviesState) {
        self.moviesState = moviesState
    }
    #endif
}
