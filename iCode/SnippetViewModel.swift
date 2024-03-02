
import Combine
import Foundation

class SnippetViewModel: ObservableObject {
    @Published var snippets: [Snippet] = [] {
        didSet {
            saveSnippets()
        }
    }
    
    init() {
        loadSnippets()
    }
    
    func addSnippet(content: String) {
        let newSnippet = Snippet(content: content)
        snippets.append(newSnippet)
    }

    private func loadSnippets() {
        let url = getDocumentsDirectory().appendingPathComponent("snippets.json")
        do {
            let data = try Data(contentsOf: url)
            snippets = try JSONDecoder().decode([Snippet].self, from: data)
        } catch {
            print("Could not load snippets: \(error)")
            addInitialSnippetIfNeeded()
        }
    }

    private func addInitialSnippetIfNeeded() {
        if snippets.isEmpty {
            let initialSnippet = Snippet(content: "Snippets are stored in ~/Library/Containers/iCoder/Data/Documents/snippets.json", isUser:false)
            snippets.append(initialSnippet)
            saveSnippets()
        }
    }
    //the saveSnippets func could be bettered, its structure notably, but
    private func saveSnippets() {
        do {
            let url = getDocumentsDirectory().appendingPathComponent("snippets.json")
            let data = try JSONEncoder().encode(snippets)
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Could not save snippets: \(error)")
        }
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
