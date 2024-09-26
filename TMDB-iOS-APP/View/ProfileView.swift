import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore


struct ProfileView: View {
    @State private var userName: String = ""
    @State private var isLoggedOut: Bool = false // Kullanıcının çıkış yaptığını izlemek için
    
    
    var body: some View {
        TabView{
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
                        
                    }
                    .padding()
                    
                    Button("Logout") {
                        logoutAndResetApp()
                    }
                    .foregroundColor(.red)
                    .padding()
                    NavigationLink(destination: LoginView(), isActive: $isLoggedOut) {
                        EmptyView()
                    }
                }
                .navigationTitle("Profile")
                .onAppear {
                    fetchUserName()
                }
            }
            
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            CategoryView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
        }
        
    }
    
    private func fetchUserName() {
        if let user = Auth.auth().currentUser {
            userName = user.displayName ?? "Kullanıcı"
        }
    }
    private func logoutAndResetApp() {
        do {
            try Auth.auth().signOut()

            // Kök görünümü resetle: Logout sonrasında LoginView'a yönlendir
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: LoginView())
                window.makeKeyAndVisible()
            }

        } catch {
            print("Logout failed: \(error.localizedDescription)")
            // Burada hata ile ilgili kullanıcıya bilgi verebilirsiniz
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
