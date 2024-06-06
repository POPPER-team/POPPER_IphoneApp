//
//  tap.swift
//  POPPER
//
//  Created by Lorena Kovačić on 29.05.2024..
//

import SwiftUI


struct TapGestureView: View {
    @State private var tapped = false


    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.tapped = !self.tapped }
    }


    var body: some View {
        Circle()
            .fill(self.tapped ? Color.blue : Color.red)
            .frame(width: self.tapped ? 100 : 200,
                   height: self.tapped ? 100 : 200)
            .gesture(tap)
    }
}


#Preview {
    TapGestureView()
}
