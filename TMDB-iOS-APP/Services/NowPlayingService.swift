import Foundation

class NowPlayingService {
    
    let url: URL
    var components: URLComponents
    
    init() {
        self.url = URL(string: "https://api.themoviedb.org/3/movie/now_playing")!
        self.components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        components.queryItems = (components.queryItems ?? []) + queryItems
    }
    
    func fetchMovies() async throws {
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTRhMWVlYzkyOWY0NmI3ZDczZDIxNzkyZmJmMmY0NCIsIm5iZiI6MTcyNjAwNjExNi43NDM3MDMsInN1YiI6IjY2Y2YwYzUwYzY4NjgxZGI0ZGEwYTU5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZIg62E8wJ6Cw6XLwZWEmNXSToufpEhr2QqDViafPK2Y"
        ]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print(String(decoding: data, as: UTF8.self))
    }
}
