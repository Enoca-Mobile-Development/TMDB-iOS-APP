//
//  FilmDetayViewModel.swift
//  MovieSearch
//
//  Created by Fatih Kahraman on 10.09.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let downloaderClient = FilmDetayService()
   
    func filmDetayiAl(id : String) {
   
        downloaderClient.filmDetayiniIndir(id: id ) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.sync{
                    self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
                }
            }
        }
    }
    
}

struct FilmDetaylariViewModel {
    
    let detay : FilmDetay
    
    var title : String{
        detay.title
    }
    
    var releaseDate : String{
        detay.releaseDate
    }
    
    var language : String{
        detay.language
    }

    var overview : String{
        detay.overview
    }
    
    var posterPath : String{
        detay.posterPath
    }
    
    var voteAverage : String{
        String(detay.voteAverage)
    }
    
    var voteCount : String{
        String(detay.voteCount)
    }
    
    var id: String {
            String(detay.id)  // Dönüştürme burada yapılıyor
        }
    
    var popularity : String{
        String(detay.popularity)
    }
}
