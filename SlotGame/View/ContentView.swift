//
//  ContentView.swift
//  SlotGame
//
//  Created by Berkay Sutlu on 9.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameViewModel = GameViewModel()
    
    @State private var isBlue = true
    @State var showAlert = false

    @State private var textColor = Color.blue
    @State var minimumBet = 2
    @State var currentMoney = 50
    
    @State var notificationText = ""
    @State private var selectedBet: String = ""
    @State var alertText = ""
    @State var slot1name = ""
    @State var slot2name = ""
    @State var slot3name = ""
    


    var body: some View {
        ZStack {
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("Your current money :")
                    
                    Text("\(currentMoney)")
                }.font(.title2).fontWeight(.heavy).foregroundColor(.yellow) // YOUR CURRENT MONEY
                VStack {
                    if currentMoney <= 0 {
                        Text("You lost!")
                    }
                    else {
                        TextField("Enter Your Bet", text: $selectedBet).padding(10).frame(maxWidth: .infinity).background(.cyan).autocorrectionDisabled()
                        Text("Selected Bet: \(selectedBet)").font(.title3).padding(20).font(.title3).foregroundColor(.white)
                    }} // HEADER TEXTFIELD
                VStack {
                    Text(notificationText)
                                .font(.largeTitle)
                                .foregroundColor(textColor)
                                .onAppear {
                                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                                        isBlue.toggle()
                                        textColor = isBlue ? .blue : .yellow
                                    }
                            }
                } // NOTIFICATION TEXT
                HStack{
                    slotImage(imageName: $slot1name)
                    slotImage(imageName: $slot2name)
                    slotImage(imageName: $slot3name)
                }.padding(10) // SLOT IMAGES
                
                
                
                if currentMoney <= 0{
                    Button {
                        currentMoney = 50
                    } label: {
                        Text("Restart").font(.largeTitle).foregroundColor(.white).padding(20).background(.blue).cornerRadius(50)
                    }
                } else {
                    Button {
                        if Int(selectedBet) != 0 {
                            if Int(selectedBet) ?? 0 <= currentMoney  {
                                
                                // Notification Text Clear
                                notificationText = ""
                                
                                
                                // Slots images
                                slot1name = gameViewModel.performThreeRandomSelections(stringsArray: Fruits)
                                slot2name = gameViewModel.performThreeRandomSelections(stringsArray: Fruits)
                                slot3name = gameViewModel.performThreeRandomSelections(stringsArray: Fruits)
                                
                                
                                // Game Condition
                                winCondition()
                                selectedBet = "0"
                            }
                            else {
                                alertText = "You don't have enough money"
                                showAlert = true
                            }} else {
                                alertText = "You have to bet money to play"
                                showAlert = true
                            }
                    } label: {
                        Text("Play").font(.largeTitle).foregroundColor(.white).padding(20).background(.blue).cornerRadius(50)
                    }.padding(10).alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text(alertText),
                            primaryButton: .default(Text("OK")),
                            secondaryButton: .cancel()
                        )
                    }
                
                } // BUTTON
                
                Spacer()
            }
            .padding()
        }
    }
    private func winCondition(){
        if slot1name == slot2name && slot2name == slot3name {
            notificationText = "You Win!!"
            currentMoney += Int(selectedBet) ?? 0 * 8
        } else {
            notificationText = "You Lost!!"
            currentMoney -= Int(selectedBet) ?? 0
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


