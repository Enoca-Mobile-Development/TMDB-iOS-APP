//
//  ImageDownloaderClient.swift
//  MovieSearch
//
//  Created by Fatih Kahraman on 9.09.2024.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url : String){
        
        guard let imageUrl = URL(string: url) else{
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else{
                return
            }
            
            DispatchQueue.main.sync {
                self.indirilenGorsel = data
            }
            
        }.resume()
    }
}

