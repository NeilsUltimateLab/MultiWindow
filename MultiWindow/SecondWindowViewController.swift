//
//  SecondWindowViewController.swift
//  MultiWindow
//
//  Created by Neil Jain on 11/17/18.
//  Copyright © 2018 Neil Jain. All rights reserved.
//

import UIKit

class SecondWindowViewController: UIViewController {
    
    static func navController() -> UINavigationController {
        let vc = SecondWindowViewController()
        vc.view.backgroundColor = .yellow
        vc.title = "Second Window's Navigation Controller"
        return UINavigationController(rootViewController: vc)
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
        button.setTitle("Awesome", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonAction() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.navigationController?.navigationBar.delegate = self
    }
    
    deinit {
        print("Deinit called from SecondWindowViewController")
    }
}

extension SecondWindowViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .any
    }
}
