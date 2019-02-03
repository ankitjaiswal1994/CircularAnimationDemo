//
//  ViewController.swift
//  CircularAnimationDemo
//
//  Created by Ankit Jaiswal on 04/02/19.
//  Copyright © 2019 Ankit Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimation()
    }

    func setUpAnimation() {
        
        let bezierPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -.pi/2, endAngle: .pi * 2, clockwise: true)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = bezierPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = .round

        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        let basicAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "abc")
    }
}

