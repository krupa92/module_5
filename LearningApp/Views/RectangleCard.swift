//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Krupa Patel on 28/7/2022.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.white
    
    var body: some View {
        
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(5)
            .shadow(radius: 5)

    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard(color: .white)
    }
}
