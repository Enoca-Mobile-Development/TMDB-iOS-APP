import SwiftUI

struct CategoryView: View {
  
    
    @StateObject private var viewModel = NowPlayingViewModel()
    @StateObject private var viewModel2 = PopularViewModel()
    @StateObject private var viewModel3 = TopRatedViewModel()
    @StateObject private var viewModel4 = UpcomingViewModel()

    
    var body: some View {
            NavigationView {
                ScrollView(.vertical) {
                    Spacer()
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
                                            .padding(.horizontal, 10)
                                        }                                }
                                }
                                .padding()
                            }
                            HStack{
                                
                                Text("Now Playing")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                Spacer()
                                
                                
                                
                                NavigationLink(destination: NowPlayingView(viewModel: viewModel)) {
                                    Text("Tümünü Göster")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                            }.padding(.top, -40)
                            
                            
                                .padding(.trailing, 10)
                        }
                        .onAppear {
                            viewModel.loadMovies()
                            
                        }
                        
                    }
                    
                    .padding(.bottom, 20) // ZStack içeriğinin altına padding ekleme
                    
                    
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
                                            .cornerRadius(10)
                                            .padding(.horizontal, 10)
                                        }
                                        
                                    }
                                }
                                .padding()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            Spacer()
                            HStack(){
                                
                                Text("Popular")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                
                                Spacer()
                                
                                NavigationLink(destination: PopularView(viewModel2: viewModel2)) {
                                    Text("Tümünü Göster")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                                
                            }
                            .padding(.top, -40)
                        }
                        
                        .padding(.trailing, 10)
                    }
                    
                    .onAppear {
                        viewModel2.loadMovies()
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
                                            .cornerRadius(10)
                                            .padding(.horizontal, 10)
                                        }
                                        
                                    }
                                }
                                .padding()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                            HStack(){
                                Text("Top Rated")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                
                                Spacer()
                                
                                NavigationLink(destination: TopRatedView(viewModel3: viewModel3)) {
                                    Text("Tümünü Göster")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                                
                            }
                            .padding(.top, -40)
                            
                        }
                        .padding(.trailing, 10)
                    }
                    .onAppear {
                        viewModel3.loadMovies()
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
                                            .cornerRadius(10)
                                            .padding(.horizontal, 10)
                                        }
                                        
                                    }
                                }
                                .padding()
                            }
                            
                            HStack(){
                                Text("Upcoming")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(10)
                                
                                Spacer()
                                
                                NavigationLink(destination: UpcomingView(viewModel4: viewModel4)) {
                                    Text("Tümünü Göster")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                
                            }
                            .padding(.top, -40)
                            
                        }
                        .padding(.trailing, 10)
                    }
                    .onAppear {
                        viewModel4.loadMovies()
                    }
                    
                }
                        }
        
                    }
                }
            
                
      


#Preview {
    CategoryView()
}

