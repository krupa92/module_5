//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Krupa Patel on 26/7/2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model:ContentModel
   
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
        
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        //set attributed text for lesson
        textView.attributedText = model.codeDiscription
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
