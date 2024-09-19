import Foundation

class SearchService{

    func searchService(search: String, completion: @escaping (Result<[Movie], DownloaderError>) -> Void) {
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")!
        components.queryItems = [
            URLQueryItem(name: "query", value: search),
            URLQueryItem(name: "api_key", value: "fa4a1eec929f46b7d73d21792fbf2f44"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "Accept": "application/json"
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            print(String(decoding: data, as: UTF8.self)) // JSON yanıtını yazdır
            
            do {
                let filmCevabi = try JSONDecoder().decode(GelenFilmler.self, from: data)
                completion(.success(filmCevabi.results)) // Burada `results` anahtarını kullanıyoruz
            } catch {
                print("JSON decode error: \(error)")
                completion(.failure(.veriIslenemedi))
            }
        }.resume()
    }

}
enum DownloaderError : Error{
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}

