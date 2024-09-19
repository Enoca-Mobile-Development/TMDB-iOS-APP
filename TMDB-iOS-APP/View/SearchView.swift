import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()  // ViewModel'i burada kullanıyoruz

    var body: some View {
        NavigationView {
            VStack {
                // Arama çubuğu
                SearchBar(text: $viewModel.searchQuery)
                
                // Yükleniyor göstergesi
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                
                // Arama sonuçları
                List(viewModel.searchResults) { movie in
                    NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                        HStack {
                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                .frame(width: 80, height: 120)
                                .cornerRadius(8)
                            Text(movie.title)
                                .font(.headline)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    SearchView()
}
