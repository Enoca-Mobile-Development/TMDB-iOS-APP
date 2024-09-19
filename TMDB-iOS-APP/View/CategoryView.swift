import SwiftUI

struct CategoryView: View {
    @State private var isLoadingMore = false
    @State private var isLoadingMore2 = false
    @State private var isLoadingMore3 = false
    @State private var isLoadingMore4 = false

    
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
                                
                            }
                            
                        }.padding(.top, -40)
                          
                        
                        .padding(.trailing, 10)
                    }
                    .onAppear {
                        viewModel.loadMovies()
                        
                    }
                    .fullScreenCover(isPresented: $isFullScreen) {
                        NowPlayingView(viewModel: viewModel)
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
                            
                            
                        }
                    }
                        .padding(.top, -40)
                }
                
                    .padding(.trailing, 10)
                }
                
                .onAppear {
                    viewModel2.loadMovies()
                }
                .fullScreenCover(isPresented: $isFullScreen2) {
                    PopularView(viewModel2: viewModel2)
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
                                
                            }
                        }
                        .padding(.top, -40)
                        
                    }
                    .padding(.trailing, 10)
                }
                .onAppear {
                    viewModel3.loadMovies()
                }
                .fullScreenCover(isPresented: $isFullScreen3) {
                    TopRatedView(viewModel3: viewModel3)
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
                                
                            }
                        }
                        .padding(.top, -40)
                        
                    }
                    .padding(.trailing, 10)
                }
                .onAppear {
                    viewModel4.loadMovies()
                }
                .fullScreenCover(isPresented: $isFullScreen4) {
                    UpcomingView(viewModel4: viewModel4)
                }
            }
        }
        
        }
    
}



#Preview {
    CategoryView()
}

