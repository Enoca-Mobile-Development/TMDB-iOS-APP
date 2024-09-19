import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchResults: [Movie] = []  // Arama sonuçları burada tutulacak
    @Published var searchQuery: String = "" {   // Kullanıcının arama çubuğuna yazdığı metin
        didSet {
            searchMovies() // Her yeni karakter yazıldığında arama yapılacak
        }
    }
    @Published var isLoading = false  // Arama işlemi sırasında spinner göstermek için

    private let downloaderClient = SearchService()
    private var cancellables = Set<AnyCancellable>() // Combine kullanımı için

    init() {
        // searchQuery'deki değişiklikleri dinleyip arama fonksiyonunu tetikliyoruz
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main) // 0.5 saniye bekleme süresi
            .removeDuplicates() // Aynı arama terimlerini tekrar sorgulamamak için
            .sink { [weak self] query in
                if !query.isEmpty {
                    self?.searchMovies() // Arama yapılacak
                } else {
                    self?.searchResults = [] // Eğer sorgu boşsa sonuçları temizle
                }
            }
            .store(in: &cancellables)
    }

    func searchMovies() {
        guard !searchQuery.isEmpty else { return }

        isLoading = true
        downloaderClient.searchService(search: searchQuery) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movies):
                    self?.searchResults = movies ?? [] // Filmler başarılı şekilde geldi
                case .failure(let error):
                    print("Error searching movies: \(error)") // Hata durumunda hata mesajı
                }
            }
        }
    }
}
