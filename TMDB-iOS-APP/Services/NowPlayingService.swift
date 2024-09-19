import Foundation
import Combine

class NowPlayingService {
    
    private let apiKey = "fa4a1eec929f46b7d73d21792fbf2f44"
    private let baseURL = "https://api.themoviedb.org/3/movie/now_playing"
    
    func fetchNowPlaying(search: String, value: String) -> AnyPublisher<[Movie], Error> {
        var components = URLComponents(string: baseURL)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: value),
            URLQueryItem(name: "query", value: search) // Arama terimi ekleyebilirsiniz
        ]
        components.queryItems = queryItems
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NowPlayingResponse.self, decoder: JSONDecoder())
            .map(\.results)
            .receive(on: DispatchQueue.main) // Ana iş parçacığına geçiş yapar
            .eraseToAnyPublisher()
    }
    

}

