//
//  ContentView.swift
//  KeenASRDemo
//
//  Created by Lyndsey Scott on 8/23/20.
//  Copyright © 2020 Lyndsey Scott LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var kiosController: KIOSController
    @State var isListening = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("KeenASR " + (isListening ? "On" : "Off"))
                    .font(Font.system(size: 12, weight: .light, design: .default))
                    .foregroundColor(isListening ? Color.black : Color.gray)
                    .multilineTextAlignment(.trailing)
                    .lineLimit(2)
                Toggle("Speech Recognition", isOn: $isListening).labelsHidden().onTapGesture {
                    self.isListening = !self.isListening
                    self.kiosController.toggleListening(self.isListening)
                }
            }
            Text(self.kiosController.spokenText.isEmpty ? " " : "\" \(self.kiosController.spokenText) \"")
                .foregroundColor(Color.black)
                .lineLimit(2)
                .frame(height: 80, alignment: Alignment.center)
                .font(Font.system(size: 20, weight: .semibold).italic())
            Rectangle()
                .foregroundColor(Color(self.kiosController.color ?? .white))
                .overlay(Rectangle().stroke(lineWidth: 1.0)
                .foregroundColor(Color.black), alignment: .center)
                .shadow(color: Color.black.opacity(0.15), radius: 2.0, x: 0, y: 0)
                .animation(self.kiosController.action ?? .default)
            HStack {
                List {
                    Section(header: Text("Actions").font(Font.system(size: 16, weight: .semibold))) {
                        ForEach(kiosController.actions, id: \.self) { action in
                            Text(action)
                            .padding(.leading)
                            .font(Font.system(size: 14))
                        }
                    }
                }.environment(\.defaultMinListRowHeight, 35)
                List {
                    Section(header: Text("Colors").font(Font.system(size: 16, weight: .semibold))) {
                        ForEach(kiosController.colors, id: \.self) { color in
                            Text(color)
                            .padding(.leading)
                            .font(Font.system(size: 14))
                        }
                    }
                }.environment(\.defaultMinListRowHeight, 35)
            }.frame(height: 250.0, alignment: .center)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(KIOSController())
    }
}
