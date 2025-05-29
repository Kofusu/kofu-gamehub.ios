//
//  Tags.swift
//  kofu-gamehub
//
//  Created by Hendratara Pratama on 29/05/25.
//

import SwiftUI

struct Tags: View {
    var text = ""
    
    var body: some View {
        
        Text(text)
            .lineLimit(1)
            .font(.custom("VT323-Regular", size: 17))
            .dynamicTypeSize(.medium ... .accessibility5)
            .foregroundStyle(.lightCyan)
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
            .background {
                RoundedRectangle(cornerRadius: 14, style: .circular)
                    .fill(.darkCyan)
            }
    }
}

#Preview {
    Tags(text: "Text")
}
