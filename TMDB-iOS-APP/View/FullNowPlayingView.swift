import SwiftUI

struct FullNowPlayingView: View {
    
    @ObservedObject var viewModel: NowPlayingViewModel
    @State private var isLoadingMore = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading && !isLoadingMore {
                Text("Veriler Yükleniyor...")
            } else {
                List(viewModel.movies, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        // Movie poster veya detaylı bilgi ekleyebilirsiniz
                    }
                }
                .onAppear {
                    // İlk veri yükleme
                    if !viewModel.isLoading {
                        loadMoreMovies()
                    }
                }
            
            }
        }
        .onAppear {
            viewModel.loadMovies()
        }
    }
    
    private func loadMoreMovies() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        
        // Sayfa numarasını artırma ve yeni verileri yükleme işlemi
        Task {
            do {
                try await viewModel.loadMoreMovies()
                isLoadingMore = false
            } catch {
                print("Error loading more movies: \(error)")
                isLoadingMore = false
            }
        }
    }
}

#Preview {
    FullNowPlayingView(viewModel: NowPlayingViewModel())
}

