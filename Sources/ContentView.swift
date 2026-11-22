
import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        GoshWebView()
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
    }
}

struct GoshWebView: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {

        let config = WKWebViewConfiguration()

        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences

        let webView = WKWebView(
            frame: .zero,
            configuration: config
        )

        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black
        webView.scrollView.bounces = false

        webView.allowsBackForwardNavigationGestures = true

        if let url = URL(string: "https://gosh.com/") {
            webView.load(URLRequest(url: url))
        }

        return webView
    }

    func updateUIView(
        _ uiView: WKWebView,
        context: Context
    ) {}
}
