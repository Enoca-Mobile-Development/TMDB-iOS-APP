//
//  ContentView.swift
//  TMDB-iOS-APP
//
//  Created by Fatih Kahraman on 4.09.2024.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                do {
                    try await NowPlayingService().fetchMovies()
                } catch {
                    print("Hata: \(error)")
                }
            }
        }, label: {
            Text("NowPlaying")
        })
        
        Button(action: {
            Task {
                do {
                    try await PopularService().fetchMovies()
                } catch {
                    print("Hata: \(error)")
                }
            }
        }, label: {
            Text("Popular")
        })
        
        Button(action: {
            Task {
                do {
                    try await TopRatedService().fetchMovies()
                } catch {
                    print("Hata: \(error)")
                }
            }
        }, label: {
            Text("Top Rated")
        })
        
        Button(action: {
            Task {
                do {
                    try await UpcomingService().fetchMovies()
                } catch {
                    print("Hata: \(error)")
                }
            }
        }, label: {
            Text("Upcoming")
        })
        
    }
}


#Preview {
    ContentView()
}
