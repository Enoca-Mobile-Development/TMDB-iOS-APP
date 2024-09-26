import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore


struct ProfileView: View {
    @State private var userName: String = ""

    var body: some View {
        NavigationView{
            VStack {
                Text("Hoşgeldin, \(userName)")
                    .font(.largeTitle)
                    .padding()
                
                Button("Favoriler") {
                    // Favoriler sayfasına yönlendirme
                }
                .padding()
                
                Button("Ayarlar") {
                    // Ayarlar sayfasına yönlendirme
                }
                .padding()
            }
            .navigationTitle("Profile")
            .onAppear {
                fetchUserName()
            }
        }
    }
    private func fetchUserName() {
        if let user = Auth.auth().currentUser {
            userName = user.displayName ?? "Kullanıcı"
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        // AuthViewModel için örnek bir kullanıcı verisi oluştur
       

        ProfileView()
            .previewLayout(.sizeThatFits) // Önizleme boyutunu ayarlayın
            .padding() // Padding ekleyin
    }
}
