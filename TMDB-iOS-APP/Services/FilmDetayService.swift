import Foundation

class FilmDetayService {
    
    private let apiKey = "fa4a1eec929f46b7d73d21792fbf2f44"
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    
    func filmDetayiniIndir(id: String, completion: @escaping (Result<FilmDetay, DownloaderError>) -> Void) {
        // URL'yi oluştur
        guard let url = URL(string: "\(baseURL)\(id)?api_key=\(apiKey)") else {
            return completion(.failure(.yanlisUrl))
        }
        
        // Veriyi indir
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Hata durumunu kontrol et
            if error != nil {
                return completion(.failure(.veriGelmedi))
            }
            
            // Verinin varlığını ve geçerliliğini kontrol et
            guard let data = data else {
                return completion(.failure(.veriGelmedi))
            }
            
            // JSON verisini decode et
            do {
                let gelenFilmDetayi = try JSONDecoder().decode(FilmDetay.self, from: data)
                completion(.success(gelenFilmDetayi))
            } catch {
                completion(.failure(.veriIslenemedi))
            }
        }.resume()
    }
    
    enum DownloaderError: Error {
        case yanlisUrl
        case veriGelmedi
        case veriIslenemedi
    }
}

