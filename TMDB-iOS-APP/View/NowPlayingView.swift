import SwiftUI

struct NowPlayingView: View {
    
    @StateObject private var viewModel = NowPlayingViewModel()
    @State private var isFullScreen = false
    
    @StateObject private var viewModel2 = PopularViewModel()
    @State private var isFullScreen2 = false
    
    @StateObject private var viewModel3 = TopRatedViewModel()
    @State private var isFullScreen3 = false
    
    @StateObject private var viewModel4 = UpcomingViewModel()
    @State private var isFullScreen4 = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing:20){
                    ZStack(alignment: .topTrailing) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.movies) { movie in
                                    NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                                        VStack {
                                            
                                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                                .frame(width: 120, height: 200)
                                            
                                            
                                        }
                                        .frame(width: 120, height: 200)
                                        .background(Color.gray.opacity(0.3))
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                                .padding()
                            }
                            Text("Now Playing")
                                                       .font(.title)
                                                       .bold()
                                                       .padding()
                                                       .background(Color.white.opacity(0.7))
                                                       .cornerRadius(10)
                                                       .offset(y: -50)
                                                       .offset(x:-190)
                        }
                        .padding(.bottom, 20) // ZStack içeriğinin altına padding ekleme
                        Button(action: {
                            isFullScreen = true
                        }) {
                            Text("Tümünü Göster")
                                .font(.subheadline)
                                .padding(5)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .offset(y:-300)
                                .offset(x:130)
                        }
                        .padding(.trailing, 5)
                    }
                    .onAppear {
                        viewModel.loadMovies()
                    }
                    .fullScreenCover(isPresented: $isFullScreen) {
                        FullScreenMovieView(viewModel: viewModel)
                    }
                    
                VStack(spacing:20){
                    ZStack(alignment: .topTrailing) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel2.movies) { movie in
                                    NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                                        VStack {
                                            
                                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                                .frame(width: 120, height: 200)
                                        }
                                        .frame(width: 120, height: 200)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                            .padding()
                        }
                        Text("Popular")
                                                   .font(.title)
                                                   .bold()
                                                   .padding()
                                                   .background(Color.white.opacity(0.7))
                                                   .cornerRadius(10)
                                                   .offset(y: -50)
                                                   .offset(x:-250)
                    }
                    .padding(.bottom, 20) // ZStack içeriğinin altına padding ekleme
                        
                        Button(action: {
                            isFullScreen2 = true
                        }) {
                            Text("Tümünü Göster")
                                .font(.subheadline)
                                .padding(5)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .offset(y:-300)
                                .offset(x:130)
                        }
                        .padding(.trailing, 5)
                    }
                    .onAppear {
                        viewModel2.loadMovies()
                    }
                    .fullScreenCover(isPresented: $isFullScreen2) {
                        FullScreenMovieView2(viewModel2: viewModel2)
                    }
                    
                    VStack(spacing:20){
                    ZStack(alignment: .topTrailing) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel3.movies) { movie in
                                    NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                                        VStack {
                                            
                                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                                .frame(width: 120, height: 200)
                                        }
                                        .frame(width: 120, height: 200)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                            .padding()
                        }
                        Text("Top Rated")
                                                   .font(.title)
                                                   .bold()
                                                   .padding()
                                                   .background(Color.white.opacity(0.7))
                                                   .cornerRadius(10)
                                                   .offset(y: -50)
                                                   .offset(x:-220)
                    }
                    .padding(.bottom, 20) // ZStack içeriğinin altına padding ekleme
                        
                        Button(action: {
                            isFullScreen3 = true
                        }) {
                            Text("Tümünü Göster")
                                .font(.subheadline)
                                .padding(5)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .offset(y:-300)
                                .offset(x:130)
                        }
                        .padding(.trailing, 5)
                    }
                    .onAppear {
                        viewModel3.loadMovies()
                    }
                    .fullScreenCover(isPresented: $isFullScreen3) {
                        FullScreenMovieView3(viewModel3: viewModel3)
                    }
                    
                    VStack(spacing:20){
                    ZStack(alignment: .topTrailing) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel4.movies) { movie in
                                    NavigationLink(destination: DetayView(movieId: String(movie.id))) {
                                        VStack {
                                            
                                            OzelImage(url: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
                                                .frame(width: 120, height: 200)
                                        }
                                        .frame(width: 120, height: 200)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                            .padding()
                        }
                        Text("Upcoming")
                                                   .font(.title)
                                                   .bold()
                                                   .padding()
                                                   .background(Color.white.opacity(0.7))
                                                   .cornerRadius(10)
                                                   .offset(y: -50)
                                                   .offset(x:-215)
                    }
                    .padding(.bottom, 20) // ZStack içeriğinin altına padding ekleme
                        
                        Button(action: {
                            isFullScreen4 = true
                        }) {
                            Text("Tümünü Göster")
                                .font(.subheadline)
                                .padding(5)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .offset(y:-300)
                                .offset(x:130)
                        }
                        .padding(.trailing, 5)
                    }
                    .onAppear {
                        viewModel4.loadMovies()
                    }
                    .fullScreenCover(isPresented: $isFullScreen4) {
                        FullScreenMovieView4(viewModel4: viewModel4)
                    }
                }
            }
        }
    
}

struct FullScreenMovieView: View {
    @ObservedObject var viewModel: NowPlayingViewModel
    
    var body: some View {
        VStack {
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding()
            }
            .navigationTitle("Movies")

        }
        .onAppear {
            // Yükleme işlemi yapılabilir
        }
    }
}

struct FullScreenMovieView2: View {
    @ObservedObject var viewModel2: PopularViewModel
    
    var body: some View {
        VStack {
            List(viewModel2.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding()
            }
        }
        .onAppear {
            // Yükleme işlemi yapılabilir
        }
    }
}

struct FullScreenMovieView3: View {
    @ObservedObject var viewModel3: TopRatedViewModel
    
    var body: some View {
        VStack {
            List(viewModel3.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding()
            }
        }
        .onAppear {
            // Yükleme işlemi yapılabilir
        }
    }
}

struct FullScreenMovieView4: View {
    @ObservedObject var viewModel4: UpcomingViewModel
    
    var body: some View {
        VStack {
            List(viewModel4.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding()
            }
        }
        .onAppear {
            // Yükleme işlemi yapılabilir
        }
    }
}

#Preview {
    NowPlayingView()
}

