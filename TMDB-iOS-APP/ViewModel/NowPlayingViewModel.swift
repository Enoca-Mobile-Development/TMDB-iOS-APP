import SwiftUI
import Combine
import Foundation

@MainActor
class NowPlayingViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    private let service = NowPlayingService()
    private var cancellables = Set<AnyCancellable>()
    
    private var currentPage = 1  // Mevcut sayfa numarasını tutmak için
    private var hasMoreData = true // Daha fazla veri olup olmadığını izlemek için
    
    func loadMovies(search: String = "") {
        isLoading = true
        currentPage = 1  // İlk veri yükleme sırasında sayfa numarasını sıfırla
        hasMoreData = true  // İlk başta daha fazla veri olabileceğini varsay
        
        service.fetchNowPlaying(search: search, value: String(currentPage))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                    self.isLoading = false
                }
            }, receiveValue: { movies in
                if movies.isEmpty {
                    self.hasMoreData = false  // Eğer veri yoksa, daha fazla veri olmadığını belirle
                } else {
                    self.movies = movies
                    self.currentPage += 1  // Yeni sayfaya geçmek için sayfa numarasını artır
                }
            })
            .store(in: &cancellables)
    }
    
    func loadMoreMovies() async throws {
        guard !isLoading && hasMoreData else { return } // Eğer daha fazla veri yoksa, yüklemeyi durdur

        isLoading = true
        
        service.fetchNowPlaying(search: "", value: String(currentPage))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    print("Error fetching more movies: \(error)")
                    self.isLoading = false
                }
            }, receiveValue: { newMovies in
                if newMovies.isEmpty {
                    self.hasMoreData = false  // Gelen yeni veri yoksa, daha fazla veri olmadığını belirle
                } else {
                    self.movies.append(contentsOf: newMovies)  // Yeni filmleri mevcut listeye ekle
                    self.currentPage += 1  // Bir sonraki sayfaya geç
                }
            })
            .store(in: &cancellables)
    }
}

