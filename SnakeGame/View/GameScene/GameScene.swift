//
//  GameScene.swift
//  SnakeGame
//
//  Created by Gabriel do Prado Moreira on 11/05/22.
//

import SpriteKit
import GameplayKit
import GameController
import AVFoundation

public class GameScene: SKScene {
    //MARK: - Properties
    var snake = Snake()
    var food = Food()
    
    //MARK: - LifeCycle
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func sceneDidLoad() {
        self.backgroundColor = .cyan
    }
    
    public override func didMove(to view: SKView) {
        ObserveForGameControllers()
        setupGestures()
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        draw()
        snake.update()
    }
    
    //MARK: - Helpers
    public func draw() {
        self.removeAllChildren()
        self.addChild(snake.makeSnake())
        self.addChild(food.makeFood())
    }
    
    func ObserveForGameControllers() {
        NotificationCenter.default.addObserver(self, selector: #selector(connectControllers), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(disconnectControllers), name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
    }
    
    func setupControllerControls(controller: GCController) {
        controller.extendedGamepad?.valueChangedHandler =  {
            (gamepad: GCExtendedGamepad, element: GCControllerElement) in
            self.controllerInputDetected(gamepad: gamepad, element: element, index: controller.playerIndex.rawValue)
        }
    }
    
    public override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
       guard let buttonPress = presses.first?.type else { return }
            
       switch(buttonPress) {
       case .menu:
          print("Menu")
       case .playPause:
          print("Play/Pause")
       case .select:
          print("select")
       case .upArrow:
           snake.move(direction: .up)
       case .downArrow:
           snake.move(direction: .down)
       case .leftArrow:
           snake.move(direction: .left)
       case .rightArrow:
           snake.move(direction: .right)
       case .pageUp:
           print("PageUp")
       case .pageDown:
           print("PageDown")
       @unknown default:
           print("Default")
       }
    }
    
    //MARK: - Selectors
    @objc
    func connectControllers() {
        self.isPaused = false
        var indexNumber = 0
        for controller in GCController.controllers() {
            if controller.extendedGamepad != nil {
                indexNumber += 1
                setupControllerControls(controller: controller)
            }
        }
    }
    
    @objc
    func disconnectControllers() {
        self.isPaused = true
    }
    
    func setupGestures() {
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        view!.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        view!.addGestureRecognizer(swipeDown)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        view!.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        view!.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case .up:
                    snake.move(direction: .up)
                case .left:
                    snake.move(direction: .left)
                case .down:
                    snake.move(direction: .down)
                case .right:
                    snake.move(direction: .right)
                default:
                    break
            }
        }
    }
}


extension GameScene {
    func controllerInputDetected(gamepad: GCExtendedGamepad, element: GCControllerElement, index: Int) {
        if (gamepad.leftThumbstick == element)
        {
            if (gamepad.leftThumbstick.xAxis.value != 0)
            {
                
            }
        }
        
        // Right Thumbstick
        if (gamepad.rightThumbstick == element)
        {
            if (gamepad.rightThumbstick.xAxis.value != 0)
            {
              
            }
        }
        
        // D-Pad
        else if (gamepad.dpad == element)
        {
            if gamepad.dpad.up.value != 0 {
                snake.move(direction: .up)
            } else if gamepad.dpad.down.value != 0 {
                snake.move(direction: .down)
            } else if gamepad.dpad.right.value != 0 {
                snake.move(direction: .right)
            } else if gamepad.dpad.left.value != 0 {
                snake.move(direction: .left)
            }
        }
        
        // A-Button
        else if (gamepad.buttonA == element)
        {
            if (gamepad.buttonA.value != 0)
            {
               
            } else {
                
            }
        }
        
        // B-Button
        else if (gamepad.buttonB == element)
        {
            if (gamepad.buttonB.value != 0)
            {
                print("Controller: \(index), B-Button Pressed!")
            }
        }
        
        else if (gamepad.buttonY == element)
        {
            if (gamepad.buttonY.value != 0)
            {
                print("Controller: \(index), Y-Button Pressed!")
            }
        }
        
        else if (gamepad.buttonX == element)
        {
            if (gamepad.buttonX.value != 0)
            {
                print("Controller: \(index), X-Button Pressed!")
            }
        }
    }
    
}
