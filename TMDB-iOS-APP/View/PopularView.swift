import SwiftUI

struct PopularView: View {
    
    @ObservedObject var viewModel2: PopularViewModel
    @State private var isLoadingMore = false
    
    var body: some View {
        VStack {
            if viewModel2.isLoading && !isLoadingMore {
                Text("Veriler Yükleniyor...")
            } else {
                List(viewModel2.movies, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        // Movie poster veya detaylı bilgi ekleyebilirsiniz
                    }
                }
                .onAppear {
                    // İlk veri yükleme
                    if !viewModel2.isLoading {
                        loadMoreMovies()
                    }
                }
            
            }
        }
        .onAppear {
            viewModel2.loadMovies()
        }
    }
    
    private func loadMoreMovies() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        
        // Sayfa numarasını artırma ve yeni verileri yükleme işlemi
        Task {
            do {
                try await viewModel2.loadMoreMovies()
                isLoadingMore = false
            } catch {
                print("Error loading more movies: \(error)")
                isLoadingMore = false
            }
        }
    }
}

#Preview {
    PopularView(viewModel2: PopularViewModel())
}

