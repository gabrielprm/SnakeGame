//
//  Food.swift
//  SnakeGame
//
//  Created by Gabriel do Prado Moreira on 12/05/22.
//

import Foundation
import SpriteKit

struct Food {
    private var x: Int = Int.random(in: 0...1920)
    private var y: Int = Int.random(in: 0...1080)
    
//    func pickLocation()
    func makeFood() -> SKShapeNode {
        let node = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
        node.position = CGPoint(x: self.x, y: self.y)
        node.fillColor = UIColor.red
        node.strokeColor = UIColor.black
        return node
    }
}
