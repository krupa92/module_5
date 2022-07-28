//
//  ContentView.swift
//  LearningApp
//
//  Created by Krupa Patel on 22/7/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading, 20.0)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules ) { module in
                            
                            VStack(spacing:20) {
                                
                                NavigationLink(
                                    destination: ContentView().onAppear(perform: {
                                        
                                        model.findModule(currentId: module.id)
                                    }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                label: {
                                    
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lesson: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    
                                })
                                
                                NavigationLink(tag: module.id, selection: $model.currentTestSelected) {
                                    TestView().onAppear {
                                        
                                        model.beginTest(module.id)
                                    }
                                } label: {
                                    
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lesson: "\(module.test.questions.count) Lessons", time: module.test.time)
                                    
                                }
                                
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    EmptyView()
                                }

                                
                            }.accentColor(.black)
                        }
                    }.padding()
                }
                
            }.padding(.leading, 0.0).navigationTitle("Get Started")
        }.navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView().environmentObject(ContentModel()).previewInterfaceOrientation(.portraitUpsideDown)
            HomeView().environmentObject(ContentModel())
        }
    }
}
