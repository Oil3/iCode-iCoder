//
//  Item.swift
//  iCode
//
//  Created by ZZS on 17/02/2024.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case chat //this to load the URL which is a chat, functions like a embeded browser really
    case snippet // this provids a fake chat like interface in which user can save snippets of code/unformated text just lik if he was messageing himself
    case history // this is to s
    case profile // this is to load the profle page from same website as for "chat"
    case settings // this is to view settings, clear cookies/browsing data, floatin, etc
    case more // this is to have the possiiblity to have a tradititional browser window, with url bar so user can quickly lookup any URL without losing the main chat

    var id: String { self.rawValue }
    var localizedName: LocalizedStringKey {
            return LocalizedStringKey(rawValue.capitalized) //minimum required code: 13 lines of code removed
   }
}

