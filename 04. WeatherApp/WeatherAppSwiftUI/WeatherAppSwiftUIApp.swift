import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            WeatherListScreen()
                .environmentObject(Store())
        }
    }
}
