//
//  ContentModel.swift
//  LearningApp
//
//  Created by Krupa Patel on 22/7/2022.
//

import Foundation

class ContentModel : ObservableObject {
    
    @Published var modules = [Module]()
    @Published var currentModule:Module?
    @Published var currentLesson:Lessons?
    @Published var codeDiscription = NSAttributedString()
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?
    @Published var currentQuestion:Questions?
    
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    var currentQuestionIndex = 0
    
    var styleData:Data?
    
    init() {
        
        self.getLocalData()
    }
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
            let modules = try decoder.decode([Module].self, from: jsonData)
                
                self.modules = modules
                
            } catch {
                
                print("Couldn't parse local data")
            }
       
        // parse style Data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        } catch {
            
            print("coun't parse style Data")
        }
        
    }
    
    func findModule(currentId:Int) {
        
        for index in 0..<modules.count {
            
            // find current module
            if modules[index].id == currentId {
                
                currentModuleIndex = index
                break
            }
            
        }
        
        // set current module
        currentModule = modules[currentModuleIndex]
    }
    
    func currentLesson(lessonIndex:Int) {
        
        if lessonIndex < currentModule!.content.lessons.count {
            
            currentLessonIndex = lessonIndex
        } else {
            
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeDiscription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        //next lesson
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeDiscription = addStyling(currentLesson!.explanation)
            
        } else {
            
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool {
        
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func nextQuestion() {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < currentModule!.test.questions.count {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeDiscription = addStyling(currentQuestion!.content)
        } else {
            
            currentQuestionIndex = 0
            currentQuestion = nil
        }
    }
    
    func beginTest(_ moduleId:Int) {
        
        findModule(currentId: moduleId)
        
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0  > 0 {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeDiscription = addStyling(currentQuestion?.content ?? "")
        }
    }
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        if styleData != nil {
            
        data.append(self.styleData!)
        
        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString
        }
        
        return resultString
        
    }
}
