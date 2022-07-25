//
//  ContentView.swift
//  LearningApp
//
//  Created by Krupa Patel on 25/7/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                if model.currentModule != nil {
                
                ForEach(0..<model.currentModule!.content.lessons.count) { index in
                    
                    ContentViewRow(index: index)
                    
                }.navigationTitle("Learn \(model.currentModule?.category ?? "")")
                }
            }.padding()
        }
    }
}

