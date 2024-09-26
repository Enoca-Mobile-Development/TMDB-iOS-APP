import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme  // Mevcut renk modunu öğrenmek için
    @AppStorage("isDarkMode") private var isDarkMode = false  // Kullanıcı tercihini saklamak için

    var body: some View {
        VStack {
            Text("Ayarlar Sayfası")
                .font(.largeTitle)
                .padding()

            // Tema değiştirme seçeneği
            Picker("Tema Seçimi", selection: $isDarkMode) {
                Text("Açık Mod").tag(false)
                Text("Koyu Mod").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("Mevcut Mod: \(colorScheme == .dark ? "Koyu Mod" : "Açık Mod")")
                .padding()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)  // Tema ayarı yapılıyor
        .navigationTitle("Ayarlar")
        
    }
}

#Preview {
    SettingsView()
}

