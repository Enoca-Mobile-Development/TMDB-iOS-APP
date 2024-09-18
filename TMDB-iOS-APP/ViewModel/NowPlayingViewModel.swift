import SwiftUI
import Combine
import Foundation

@MainActor
class NowPlayingViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    private let service = NowPlayingService()
    private var cancellables = Set<AnyCancellable>()
    
    func loadMovies(search: String = "") {
        
        isLoading = true
        
        service.fetchNowPlaying(search: search)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                    self.isLoading = false
                }
            }, receiveValue: { movies in
                self.movies = movies
            })
            .store(in: &cancellables)
    }
    
    func loadMoreMovies() async throws {
        
    }
}


