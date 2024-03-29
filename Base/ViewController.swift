//
//  ViewController.swift
//  Base
//
//  Created by Matija Lukanić on 29.03.2024..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        btnLogin.layer.cornerRadius = 25
        btnRegister.layer.cornerRadius = 25
    }
    
    
    @IBAction func btnLogin_clicked(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func btnRegister_clicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

