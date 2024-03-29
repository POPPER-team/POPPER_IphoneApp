//
//  LoginViewController.swift
//  Base
//
//  Created by Matija Lukanić on 29.03.2024..
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavigationBar()
        setupTextField(view: viewEmail, textField: txtEmail)
        setupTextField(view: viewPassword, textField: txtPassword)
        setupRegisterButton()
    }
       
    private func setupNavigationBar() {
        navigationItem.title = "Login"
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
        btnLogin.layer.cornerRadius = 25
        btnLogin.clipsToBounds = true
    }
    
}
