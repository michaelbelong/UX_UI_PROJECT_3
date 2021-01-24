//
//  ItemRow.swift
//  Counter
//
//  Created by Metanorm on 1/23/21.
//

import SwiftUI

struct CountRow: View {
    var count: MenuItem
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "minus")
                .font(.system(size: 28))
                .padding(20)
                .foregroundColor(.white)
                .backgroundColor(.red)
                .clipShape(Circle())
                .onTapGesture {
                    self.value -= 1
                }
                .onLongPressGesture {
                    self.value -= 10
                }
            Spacer()
            
            VStack (spacing: -10) {
                Text(self.name.uppercased())
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                Text("\(cA)")
                    .font(.system(size: 78, design: .rounded))
                    .fontWeight(.regular)
                    .onTapGesture {
                        self.value += 1
                    }
                    .onLongPressGesture {
                        self.value = 1
                    }.transition(.move(edge: .leading))
            }
            
            Spacer()
            Image(systemName: "plus")
                .padding(20)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .backgroundColor(.red)
                .clipShape(Circle())
                .onTapGesture {
                    self.value += 1
                }
                .onLongPressGesture {
                    self.value += 10
                }
        }
        .padding(.all, 10)
        .frame(width: 358)
        .foregroundColor(.black)
        .backgroundColor(.red)
        .cornerRadius(30)
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(count: MenuItem.example)
    }
}
