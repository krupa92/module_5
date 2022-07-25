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
                            
                            VStack(alignment: .leading, spacing:20) {
                                
                                NavigationLink(
                                    destination: ContentView().onAppear(perform: {
                                        
                                        model.findModule(currentId: module.id)
                                    }),
                                
                                label: {
                                    
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lesson: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    
                                })

                                
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lesson: "\(module.test.questions.count) Lessons", time: module.test.time)
                                
                            }.accentColor(.black)
                        }
                    }.padding()
                }
                
            }.padding(.leading, 0.0).navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
