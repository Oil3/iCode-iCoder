
import SwiftUI

struct BrowserContainerView: View {
    @Binding var searchText: String
    @Binding var selectedURL: URL

    var body: some View {

        BrowserView( url: $selectedURL, searchText: $searchText)
    }
}
