import SwiftUI

struct TopRatedView: View {
    
    @ObservedObject var viewModel3: TopRatedViewModel
    @State private var isLoadingMore = false
    
    var body: some View {
        VStack {
            if viewModel3.isLoading && !isLoadingMore {
                Text("Veriler Yükleniyor...")
            } else {
                List(viewModel3.movies, id: \.id) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        // Movie poster veya detaylı bilgi ekleyebilirsiniz
                    }
                }
                .onAppear {
                    // İlk veri yükleme
                    if !viewModel3.isLoading {
                        loadMoreMovies()
                    }
                }
            
            }
        }
        .onAppear {
            viewModel3.loadMovies()
        }
    }
    
    private func loadMoreMovies() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        
        // Sayfa numarasını artırma ve yeni verileri yükleme işlemi
        Task {
            do {
                try await viewModel3.loadMoreMovies()
                isLoadingMore = false
            } catch {
                print("Error loading more movies: \(error)")
                isLoadingMore = false
            }
        }
    }
}

#Preview {
    TopRatedView(viewModel3: TopRatedViewModel())
}
