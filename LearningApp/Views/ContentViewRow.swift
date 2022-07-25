//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Krupa Patel on 25/7/2022.
//

import SwiftUI

struct ContentViewRow: View {
     
    @EnvironmentObject var model:ContentModel
    
    var index:Int
    
    var body: some View {
        
        var lesson = model.currentModule!.content.lessons[index]
        
        ZStack(alignment:.leading) {
            
            Rectangle().foregroundColor(.white).cornerRadius(5)
                .frame( height: 66)
                .shadow(radius: 5)
            
            HStack(spacing: 30){
                
                Text(String(index + 1))
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                VStack(alignment:.leading) {
                    
                    Text(lesson.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Video - \(lesson.duration)")
                }
                
                
            }.padding()
        }
    }
}

