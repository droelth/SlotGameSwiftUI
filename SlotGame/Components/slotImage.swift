//
//  slotImage.swift
//  SlotGame
//
//  Created by Berkay Sutlu on 10.08.2023.
//

import SwiftUI

struct slotImage: View {
    @Binding var imageName : String
    var body: some View {
        Image(imageName).resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.main.bounds.width / 4, height: 200).background(.cyan).cornerRadius(50)
    }
}

