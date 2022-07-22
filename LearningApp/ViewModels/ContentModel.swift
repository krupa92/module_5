//
//  ContentModel.swift
//  LearningApp
//
//  Created by Krupa Patel on 22/7/2022.
//

import Foundation

class ContentModel : ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData:Data?
    
    init() {
        
        getLocalData()
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
}
