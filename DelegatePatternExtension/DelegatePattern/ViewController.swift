//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Suji Jang on 12/1/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 1
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        makeUI()
        
        textField.delegate = self
    }
    
    func makeUI() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .yellow
    }
}

