//
//  ContentView.swift
//  SnakeGame
//
//  Created by Gabriel do Prado Moreira on 11/05/22.
//

import SwiftUI
import SpriteKit


struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene(size: CGSize(width: 1920, height: 1080))
        scene.size = CGSize(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
