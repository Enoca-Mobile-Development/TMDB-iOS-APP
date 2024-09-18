import SwiftUI

struct UpcomingView: View {
    
    @ObservedObject var viewModel4: UpcomingViewModel
    @State private var isLoadingMore = false
    
    var body: some View {
        VStack {
            if viewModel4.isLoading && !isLoadingMore {
                Text("Veriler Yükleniyor...")
            } else {
                List(viewModel4.movies, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        // Movie poster veya detaylı bilgi ekleyebilirsiniz
                    }
                }
                .onAppear {
                    // İlk veri yükleme
                    if !viewModel4.isLoading {
                        loadMoreMovies()
                    }
                }
            
            }
        }
        .onAppear {
            viewModel4.loadMovies()
        }
    }
    
    private func loadMoreMovies() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        
        // Sayfa numarasını artırma ve yeni verileri yükleme işlemi
        Task {
            do {
                try await viewModel4.loadMoreMovies()
                isLoadingMore = false
            } catch {
                print("Error loading more movies: \(error)")
                isLoadingMore = false
            }
        }
    }
}

#Preview {
    UpcomingView(viewModel4: UpcomingViewModel())
}


