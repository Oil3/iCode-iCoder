//
//  SnipptViewModel.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import Combine

class SnippetViewModel: ObservableObject {
    @Published var snippets: [Snippet] = []
    
    func addSnippet(content: String) {
        let newSnippet = Snippet(content: content)
        snippets.append(newSnippet)
    }
}
