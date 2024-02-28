//
//  SnippetView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

struct SnippetView: View {
    @State private var newSnippetContent: String = ""
    @ObservedObject var viewModel = SnippetViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.snippets) { snippet in
                    HStack {
//                        Image(systemName: "person.fill") // Icon for the "human"
//                            .padding()
                        VStack(alignment: .leading) {
//                            Text("Human") // Probably useless, takes space
//                                .foregroundColor(.gray)
                            Text(snippet.content)
                                .font(.custom("SF Mono", size: 14))
                            Text("\(snippet.timestamp, formatter: itemFormatter)")
                                .font(.custom("SF Mono", size:10))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            HStack {
                TextField("Type or Paste", text: $newSnippetContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        viewModel.addSnippet(content: newSnippetContent)
                        newSnippetContent = ""
                    }
                
                Button(action: {
                    viewModel.addSnippet(content: newSnippetContent)
                    newSnippetContent = ""
                }) {
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }.padding()
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

