//
//  TestResultView.swift
//  LearningApp
//
//  Created by Krupa Patel on 28/7/2022.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var numCorrect:Int
    
    var resultHeading:String {
        
        guard model.currentModule != nil else {
            
            return ""
        }
        
        if numCorrect > 7 {
            
            return "Awesome!"
        } else if numCorrect > 4 {
            
            return "Doing Great!"
        } else {
            
            return "keep learning"
            
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(resultHeading)
                .font(.title)
            Spacer()
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            Spacer()
            Button {
                
                model.currentTestSelected = nil
                
            } label: {
                
                ZStack {
                    
                    RectangleCard(color: .green)
                        .frame(height:48)
                    Text("Complete")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }.padding()
            }
            Spacer()
        }
    }
}
