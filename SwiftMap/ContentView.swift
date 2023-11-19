//
//  ContentView.swift
//  SwiftMap
//
//  Created by ٍٍRaneem A on 05/05/1445 AH.
//


import SwiftUI

struct ContentView: View {
    //Initial array of integers
    @State private var data = [0]
        @State private var newItemText = ""

    //Create an array of Colors by mapping the data array
    var colors: [Color] {
        return data.map { colorForValue($0) }
    }

    var body: some View {
        
        VStack(spacing: 20) {
                   HStack {
                       TextField("Enter new item:", text: $newItemText).padding(20)
                       Button("Add") {
                           if !newItemText.isEmpty {
                               data.append(Int(newItemText) ?? 0)
                               newItemText = ""
                           }
                       }.padding(20)
                   }
               }
        
        
        HStack(alignment: .bottom, spacing: 2) {
            //Mapping the integers to colored rectangles
            ForEach(data.indices, id: \.self) { i in
                Rectangle()
                    .fill(colors[i]) //Applying the color
                    .frame(width: 20, height: CGFloat(data[i]) * 20) //Scaling the height
            }
        }
    }
    
    //Function to map integer values to colors
    func colorForValue(_ value: Int) -> Color {
        let scaledValue = Double(value) / 10.0 //Assuming maximum value is 10 for color scaling
        return Color(red: scaledValue, green: 0, blue: 1 - scaledValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
