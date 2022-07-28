//
//  TestResultView.swift
//  LearningApp
//
//  Created by Krupa Patel on 28/7/2022.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    var numCorrect = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Doing great")
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

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
