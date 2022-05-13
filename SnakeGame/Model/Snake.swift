//
//  Snake.swift
//  SnakeGame
//
//  Created by Gabriel do Prado Moreira on 11/05/22.
//

import SpriteKit

enum Directions {
    case up
    case down
    case left
    case right
}

struct Snake {
    private var x: CGFloat = UIScreen.screenWidth/2
    private var y: CGFloat = UIScreen.screenHeight/2
    private var vx: CGFloat = 1
    private var vy: CGFloat = 0
//    private var size: CGFloat
    
    mutating func update() {
        
        if self.x < UIScreen.screenWidth - Global.scale - 15 && self.x > 0 + Global.scale + 15 {
            self.x = self.x + self.vx * 5
        }
        if self.y < UIScreen.screenHeight - Global.scale - 15 && self.y > 0 + Global.scale + 15{
            self.y = self.y + self.vy * 5
        }
        
    }
    
    mutating func move(direction: Directions) {
        switch direction {
            case .up:
                self.vx = 0
                self.vy = 1
            case .down:
                self.vx = 0
                self.vy = -1
            case .left:
                self.vx = -1
                self.vy = 0
            case .right:
                self.vx = 1
                self.vy = 0
        }
    }
    
    func accelerate() {
        
    }
    
    func makeSnake() -> SKShapeNode {
        let node = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
        node.position = CGPoint(x: self.x, y: self.y)
        node.fillColor = UIColor.white
        node.strokeColor = UIColor.black
        return node
    }
}
