//
//  EditorViewController.swift
//  MasqWithSwiftUI
//
//  Created by 温蟾圆 on 2020/6/23.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    lazy var inputTextField = {
        return UITextView()
    }()
    
    override func viewDidLoad() {
        inputTextField.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
//        inputTextField.backgroundColor = .blue
        inputTextField.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        inputTextField.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(inputTextField)
//        view.backgroundColor = .red
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if !inputTextField.text.isEmpty {
            DiaryManager.addArticle(content: inputTextField.text, date: Date())
        }
    }
}
