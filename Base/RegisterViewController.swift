//
//  RegisterViewController.swift
//  Base
//
//  Created by Matija Lukanić on 29.03.2024..
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavigationBar()
        setupTextField(view: viewUsername, textField: txtUsername)
        setupTextField(view: viewEmail, textField: txtEmail)
        setupTextField(view: viewPassword, textField: txtPassword)
        setupRegisterButton()
    }
       
    private func setupNavigationBar() {
        navigationItem.title = "Register"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
       
    private func setupTextField(view: UIView, textField: UITextField) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        textField.borderStyle = .none
    }
       
    private func setupRegisterButton() {
        btnRegister.layer.cornerRadius = 25
        btnRegister.clipsToBounds = true
    }

}
