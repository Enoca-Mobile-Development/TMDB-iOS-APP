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
            .navigationTitle("Login")

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
