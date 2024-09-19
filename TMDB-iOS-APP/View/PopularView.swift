import SwiftUI

struct PopularView: View {
    
    @ObservedObject var viewModel2: PopularViewModel
    @State private var isLoadingMore = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel2.movies, id: \.id) { movie in
                        NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                .frame(width: 160, height: 240)
                                .cornerRadius(10)
                        }
                        .onAppear {
                            // Son filme ulaşıldığında daha fazla veri yükle
                            if movie == viewModel2.movies.last {
                                loadMoreMovies()
                            }
                        }
                    }
                   
                }
                .padding()
            }
            .navigationTitle("Popular Movies")
            .onAppear {
                viewModel2.loadMovies()
            }
        }
    }
    
    private func loadMoreMovies() {
        guard !isLoadingMore else { return }
        isLoadingMore = true

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

