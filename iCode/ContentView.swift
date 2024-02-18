//
//  ContentView.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI


// actual view
struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SnippetView()
        } detail: {
            BrowserView()
            }

        }
     }
            

// ContentView previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
