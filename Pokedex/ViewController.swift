//
//  ViewController.swift
//  Pokedex
//
//  Created by Felipe on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        createView(yPosition: 0, background: .blue)
        createView(yPosition: self.view.frame.height / 2, background: .yellow)
    }
    
    private func createView(yPosition: CGFloat, background: UIColor) {
        let view = UIView(frame: CGRect(x: 0, y: yPosition, width: self.view.frame.width, height: self.view.frame.height / 2))
        view.backgroundColor = background
        self.view.addSubview(view)
    }


}

