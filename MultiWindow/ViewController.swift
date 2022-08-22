//
//  ViewController.swift
//  MultiWindow
//
//  Created by Neil Jain on 11/17/18.
//  Copyright © 2018 Neil Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static func navController() -> UINavigationController {
        let viewController = ViewController()
        return UINavigationController(rootViewController: viewController)
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        button.setTitle("Awesome", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.title = "Window 1's navigation controller"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func buttonAction() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

