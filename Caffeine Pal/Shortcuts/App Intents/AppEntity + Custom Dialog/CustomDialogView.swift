//
//  CustomDialogView.swift
//  Caffeine Pal
//
//  Created by Navin Kumar R on 16/08/24.
//

import SwiftUI

struct BreakLoggedView: View {
  let breakIncrement: BreakIncrement
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Image(systemName: "clock")
          .foregroundColor(.orange)
          .padding(10)
          .background(Circle().fill(Color.orange.opacity(0.2)))
        
        VStack(alignment: .leading, spacing: 4) {
          Text("\(breakIncrement.displayName) Break Logged")
            .font(.headline)
            .foregroundColor(.primary)
          
          Text("Time: \(breakIncrement.minutes) minutes")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        Spacer()
      }
      .padding()
      .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
      .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
    .padding(.horizontal)
  }
}

#Preview {
  BreakLoggedView(breakIncrement: BreakIncrement.all[0])
    .previewLayout(.sizeThatFits)
  
}
