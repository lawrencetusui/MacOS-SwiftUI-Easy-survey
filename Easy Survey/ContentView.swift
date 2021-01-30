//
//  ContentView.swift
//  Easy Survey
//
//  Created by Lawrence Tsui on 26/1/21.
//

import SwiftUI

enum Position {
    case answered, current, upcoming
}

struct ContentView: View {
    @State private var number = 0
    var questions = ["How old are you?", "What do you do for fun?", "What is your gender?"]
    var answers = [String]()

    var body: some View {
     
        ZStack {
            ForEach(0..<questions.count, id: \.self) { index in
                HStack{
                    Text(questions[index])
                        .padding([.top, .bottom, .leading])
                        .offset(x: 0, y: CGFloat(index) * 100 - CGFloat(self.number) * 100)
                    ZStack{
                        
                        Text(" ")
                            .padding()
                            .frame(width: 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                .font(.system(size: 48, weight: .regular, design: .monospaced))
                .foregroundColor(.white)
                
            }
        
            

            VStack {
                HStack {
                    Spacer()
                        .padding()
                        .background(Capsule().fill(Color.white.opacity(0.8)))
                        .animation(nil)
                }
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()

                Spacer()
            }
            .padding()
        }
        .frame(width: 1000, height: 600)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .onReceive(NotificationCenter.default.publisher(for: .enterNumber)){ note in
           // guard let number = note.object as? Int else { return }//if anything else than a number just bail just bail out other else print
             //   answers[number] = number
          //  self.answers[self.number] += String(number)
        }
        .onReceive(NotificationCenter.default.publisher(for: .removeNumber)){ _ in
            print("Remove")
        }
        .onReceive(NotificationCenter.default.publisher(for: .submitAnswer)){ _ in
            if self.answers[self.number].isEmpty == false{
                withAnimation {
                self.number += 1
            }
            }
        }
   

       
        }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
