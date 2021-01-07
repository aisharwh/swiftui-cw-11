//
//  ContentView.swift
//  cw7-1
//
//  Created by MacBook` on 05/01/2021.
//

struct Field {
    var player: String
    var enabled: Bool
    
}

import SwiftUI

struct ContentView: View {
    @State var fields = [
        [Field(player: "", enabled: true), Field(player: "", enabled: true), Field(player: "", enabled: true)],
        
        [Field(player: "", enabled: true), Field(player: "", enabled: true), Field(player: "", enabled: true)],
        
        [Field(player: "", enabled: true), Field(player: "", enabled: true), Field(player: "", enabled: true)]
    ]
    
    @State var playerTurn: String = "X"
    
    @State var winner = ""
    @State var winStatus = false
    @State var drawCounter = 0
    
    var body: some View {
        VStack(spacing: 10)
        {
            Text("\(playerTurn)'s Turn")
                .font(.largeTitle)
            
            ForEach(0..<3){ r in
                HStack(spacing: 10)
                {
                    ForEach(0..<3){ c in
                        Button(action: {
                            if fields[r][c].enabled {
                                fields[r][c].enabled = false
                                fields[r][c].player = playerTurn
                                drawCounter += 1
                                checkWinner()
                            if winStatus == false
                                {
                                playerTurn = playerTurn == "X" ? "O" : "X"
                                    fields[r][c].enabled = false
                                }
                                else {
                                    fields[0][0].enabled = false
                                    fields[0][1].enabled = false
                                    fields[0][2].enabled = false
                                    fields[1][0].enabled = false
                                    fields[1][1].enabled = false
                                    fields[1][2].enabled = false
                                    fields[2][0].enabled = false
                                    fields[2][1].enabled = false
                                    fields[2][2].enabled = false
                                    
                                    
                                }
                                }
                        })
                            {
                            Text(fields[r][c].player)
                                .font(.system(size: 60))
                                .foregroundColor(.black)
                                .frame(width: 90, height: 90, alignment: .center)
                                .background(Color.gray.opacity(0.5))
                        }
                    
                }
                   
            }
            }.background(Color.white)
         
            if winner != "" {
                Button(action: {
                    restartG()
            })
                {
                    Text("Restart")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(Color.black)
                        .frame(width: 180,height: 40,alignment: .center)
                        .background(Color.white)
                }.padding( .top, 20)
        }
       
    }
    }
    
    func checkWinner () {
        let r1 = fields[0][0].player == playerTurn
            && fields[0][1].player == playerTurn
            && fields[0][2].player == playerTurn
        
        let r2 = fields[1][0].player == playerTurn
            && fields[1][1].player == playerTurn
            && fields[1][2].player == playerTurn
        
        let r3 = fields[2][0].player == playerTurn
            && fields[2][1].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let c1 = fields[0][0].player == playerTurn
            && fields[1][0].player == playerTurn
            && fields[2][0].player == playerTurn
        
        let c2 = fields[0][1].player == playerTurn
            && fields[1][1].player == playerTurn
            && fields[2][1].player == playerTurn
        
        let c3 = fields[0][2].player == playerTurn
            && fields[1][2].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let d1 = fields[0][0].player == playerTurn
            && fields[1][1].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let d2 = fields[0][2].player == playerTurn
            && fields[1][1].player == playerTurn
            && fields[2][0].player == playerTurn
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
        {
            winner = ("\(playerTurn) wins")
            winStatus = true
            
        }else if drawCounter == 9
            {
                winner = "Draw"
                winStatus = true
            }
        
    }
    
     func restartG () {
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 3), count: 3)
        playerTurn = "X"
        winner = ""
        winStatus = false
        drawCounter = 0
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
