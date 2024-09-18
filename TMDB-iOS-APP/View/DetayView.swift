import SwiftUI

struct DetayView: View {
    @StateObject private var viewModel = FilmDetayViewModel()
    let movieId: String

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 20) {
                if let filmDetayi = viewModel.filmDetayi {
                    // Görseli ortala
                    OzelImage(url: "https://image.tmdb.org/t/p/original/\(filmDetayi.posterPath)")
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                        .padding()
                    
                    // Başlık
                    Text(filmDetayi.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    // Diğer detaylar
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Yayın Tarihi:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.releaseDate)
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Text("Dil:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.language)
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Text("Özet:")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.overview)
                            .padding(.horizontal)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Popülerlik:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.popularity)
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Text("Puan:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.voteAverage)
                            .font(.subheadline)
                            .padding(.horizontal)
                        
                        Text("Oylama Sayısı:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text(filmDetayi.voteCount)
                            .font(.subheadline)
                            .padding(.horizontal)
                    }
                } else {
                    // Yükleniyor metni
                    Text("Yükleniyor...")
                        .font(.title2)
                        .padding()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.filmDetayiAl(id: movieId)
        }
    }
}

#Preview {
    DetayView(movieId: "")
}

