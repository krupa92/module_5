//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Krupa Patel on 25/7/2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            
            // video
            if url != nil {
                
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            // Description:
            CodeTextView()
            
            if model.hasNextLesson() {
            Button {
                model.nextLesson()
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .frame(height:48)
                        .foregroundColor(.green)
                        .cornerRadius(5)
                    
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex].title)")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            }

            } else {
                
                Button {
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(height:48)
                            .foregroundColor(.green)
                            .cornerRadius(5)
                        
                        Text("Complete")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                }
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
