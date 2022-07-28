//
//  TestView.swift
//  LearningApp
//
//  Created by Krupa Patel on 27/7/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var issumbited = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack{
                
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Questions
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack{
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                
                                selectedAnswerIndex = index
                                
                            } label: {
                                
                                ZStack {
                                    
                                    if issumbited == false {
                                    RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                        .frame( height: 48)
                                    } else {
                                        
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            
                                            RectangleCard(color: Color.green)
                                                .frame(height:48)
                                        } else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                            
                                            RectangleCard(color: Color.red)
                                                .frame(height:48)
                                        } else if index == model.currentQuestion!.correctIndex {
                                            
                                            RectangleCard(color: Color.green)
                                                .frame(height:48)
                                        }
                                        else {
                                            
                                            RectangleCard(color: Color.white)
                                                .frame(height:48)
                                        }
                                    }
                                    
                                    Text(model.currentQuestion!.answers[index])
                                }
                                
                            }.disabled(issumbited)
                        }
                    }.accentColor(.black).padding()
                }
                // submit button
                Button {
                    
                    if issumbited == true {
                        
                        model.nextQuestion()
                        
                        issumbited = false
                        selectedAnswerIndex = 0
                    } else {
                        
                        issumbited = true
                        
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            
                            numCorrect += 1
                        }
                    }
                    
                    
                    
                } label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height:48)
                        
                        Text(buttonText)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }.padding()
                }.disabled(selectedAnswerIndex == nil)

                
            }.navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            
            TestResultView(numCorrect: numCorrect)
            
            
        }
    }
    
    var buttonText:String {
        
        if issumbited == true {
            if model.currentQuestionIndex + 1  == model.currentModule!.test.questions.count {
                
                return "Finish"
            } else {
                
                return "Next"
            }
            
        } else {
            
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
