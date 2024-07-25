//
//  ContentView.swift
//  PKHeXMac
//
//  Created by Matthew Conrad on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let badwords = TextUtil.getTextFileTest() ?? ""

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(badwords)
        }
        .padding()
    }
}
