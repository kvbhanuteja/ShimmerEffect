//
//  AnimationView.swift
//  ShimmerEffect
//
//  Created by bhanuteja on 18/08/22.
//

import Foundation
import SwiftUI

struct AnimationView: View {
    @State var isAnimating: Bool = false
    private var size: CGSize
    private var offset: CGFloat
    private var rotationAngle: Angle
    private var linearGradient: LinearGradient
    private var shimmerColor: Color
    private var shimmerSize: CGSize
    private var cornerRadius: CGFloat
    private var primaryColor: Color
    private var animation: Animation
    
    init(size: CGSize = CGSize(width: 350, height: 200),
         primaryColor: Color = .black.opacity(0.1),
         rotationAngle: Angle = Angle(degrees: -70),
         animationSpeed: CGFloat = 0.2,
         shimmerColor: Color = .white.opacity(0.2),
         cornerRadius: CGFloat = 10) {
        self.isAnimating = false
        self.size = size
        self.offset = size.width*1.5
        self.rotationAngle = rotationAngle
        self.linearGradient = LinearGradient(colors: [shimmerColor.opacity(0.1),
                                                      shimmerColor,
                                                      shimmerColor.opacity(0.1)], startPoint: .top, endPoint: .bottom)
        self.animation = Animation.default.speed(animationSpeed).delay(0)
            .repeatForever(autoreverses: false)
        self.shimmerColor = shimmerColor
        self.shimmerSize = CGSize(width: size.width*1.5,
                                  height: size.height*1.5)
        self.cornerRadius = cornerRadius
        self.primaryColor = primaryColor
    }
    var body: some View {
        primaryColor
            .frame(width: size.width, height: size.height)
            .overlay(LoadingView())
            .cornerRadius(cornerRadius)
            .onAppear {
                withAnimation(animation) {
                    self.isAnimating.toggle()
                }
            }
    }
    
    private func LoadingView() -> some View {
            Rectangle()
                .fill(self.linearGradient)
                .cornerRadius(cornerRadius)
                .frame(width: shimmerSize.width,
                       height: shimmerSize.height)
                .rotationEffect(rotationAngle)
                .offset(x: isAnimating ? offset : -offset)
    }
    
    
}

struct LoadingcellView_Preview: PreviewProvider {
    static var previews: some View {
        return AnimationView()
            .preferredColorScheme(.dark)
            
    }
}
