import SwiftUI

struct OzelImage: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        Group {
            if let data = self.imageDownloaderClient.indirilenGorsel,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image("placeholder") // Yer tutucu görsel
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    OzelImage(url: "http://image.tmdb.org/t/p/original/865DntZzOdX6rLMd405R0nFkLmL.jpg")
}
