import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore


struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var registrationSuccessful: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        
        NavigationView{
            VStack {
                
                // Movie App Başlığı
                Text("MOVIE APP")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .padding(.bottom,100)
                    .frame(maxWidth: .infinity,alignment: .center)
           
                // Register Başlığı
                Text("Sign In")
                    .font(.title2)
                    .padding(.bottom, 30)
                    .fontWeight(.bold)
                    .padding(.leading, -175)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Register") {
                    register()
                }
                .padding()
                
                if let errorMessage = errorMessage {
                             Text(errorMessage)
                                 .foregroundColor(.red)
                                 .padding()
                         }
                
                NavigationLink(destination: LoginView()) {
                              Text("Already have an account? Login here.")
                                  .foregroundColor(.blue)
                                  .padding()
                          }                .padding()
                
                
                NavigationLink(destination: LoginView(), isActive: $registrationSuccessful){}
                
                
            }
        }
        .navigationBarBackButtonHidden(true) // 1
    }
    
    
    private func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }

            // Kayıt başarılı
            if let user = result?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    if error == nil {
                        registrationSuccessful = true
                    }
                }
            }
        }
    }
    
}


#Preview {
    RegisterView()
}
