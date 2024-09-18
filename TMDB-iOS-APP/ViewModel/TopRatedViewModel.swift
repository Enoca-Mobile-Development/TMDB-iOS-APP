import SwiftUI
import Combine
import Foundation

@MainActor
class TopRatedViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    private let service = TopRatedService()
    private var cancellables = Set<AnyCancellable>()
    
    func loadMovies(search: String = "") {
        isLoading = true
        
        service.fetchTopRated(search: search)
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
        // Yeni sayfa numarası veya diğer parametreler ile verileri yükleyin
        // Örneğin, sayfa numarasını artırarak yeni filmleri çekebilirsiniz
    }
}

