import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginSuccessful: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                
                // Movie App Başlığı
                Text("MOVIE APP")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, -40)
                    .padding(.bottom,100)
                    .frame(maxWidth: .infinity,alignment: .center)
              
   
                
                // Register Başlığı
                Text("Sign In")
                    .font(.title2)
                    .padding(.bottom, 30)
                    .fontWeight(.bold)
                    .padding(.leading, -175)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Login") {
                    login()
                }
                .padding()
                
                // Giriş başarılı olduğunda ProfileView'a yönlendirme
                NavigationLink(destination: ProfileView(), isActive: $loginSuccessful) {
                    EmptyView()
                }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                NavigationLink(destination: RegisterView()) {
                    Text("Don't have an account? Register here.")
                        .padding()
                }
            }

        }
        .navigationBarBackButtonHidden(true) // 1

    }

    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }
            // Giriş başarılı
            loginSuccessful = true
        }
    }
}


#Preview {
    LoginView()
}
