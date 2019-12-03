//
//  ViewController.swift
//  Sign Up-Sign in
//
//  Created by aidin ahmadian on 12/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    
// MARK: Creating (UILabels / UIButtons) Programmatically For our ViewController
    
    
    let titleLabel: UILabel = {
       let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Reader"
        tl.font = UIFont.boldSystemFont(ofSize: 40)
        tl.textColor = .black
        return tl
    }()
    
    let descriptionLabel: UILabel = {
       let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Find Compelling Ideas\nand Prespective"
        dl.textAlignment = .center
        dl.numberOfLines = 0
        dl.font = UIFont.boldSystemFont(ofSize: 30)
        dl.textColor = .black
        return dl
    }()

    let aboutUsButton: UIButton = {
       let aub = UIButton()
        aub.translatesAutoresizingMaskIntoConstraints = false
        aub.setTitle("About Us", for: .normal)
        aub.backgroundColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        aub.setTitleColor(.white, for: .normal)
        aub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        aub.addTarget(self, action: #selector(aboutUsButtonAction), for: .touchUpInside)
        aub.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        aub.layer.shadowOffset = CGSize(width: 0, height: 3)
        aub.layer.shadowOpacity = 1.0
        aub.layer.shadowRadius = 10.0
        aub.layer.cornerRadius = 10
        aub.layer.masksToBounds = false
        return aub
    }()
    
    let logInButton: UIButton = {
        let lb = UIButton()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.setTitle("Login Now", for: .normal)
        lb.setTitleColor(.white, for: .normal)
        lb.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        lb.backgroundColor = .black
        lb.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        lb.layer.shadowOffset = CGSize(width: 0, height: 3)
        lb.layer.shadowOpacity = 1.0
        lb.layer.shadowRadius = 10.0
        lb.layer.masksToBounds = false
        lb.layer.cornerRadius = 10
        return lb
    }()
    
    let createAccountButton: UIButton = {
        let cab = UIButton()
        cab.translatesAutoresizingMaskIntoConstraints = false
        cab.setTitle("Create an Account", for: .normal)
        cab.setTitleColor(.black, for: .normal)
        cab.addTarget(self, action: #selector(createAccountAction), for: .touchUpInside)
        cab.backgroundColor = .white
        cab.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cab.layer.shadowOffset = CGSize(width: 0, height: 3)
        cab.layer.shadowOpacity = 1.0
        cab.layer.shadowRadius = 10.0
        cab.layer.masksToBounds = false
        cab.layer.cornerRadius = 10
        return cab
    }()
    
    
//MARK: viewDidLoad Function
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "firstbackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        setupViews()
        setupConstraints()
    }
    
    
//MARK: SetupViews Function
    
    
    func setupViews() {
        view.addSubview(logInButton)
        view.addSubview(createAccountButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(aboutUsButton)
    }
    
    
// MARK: Setup Constraints Programmatically Using Anchors
    
    
    func setupConstraints() {
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        createAccountButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 100).isActive = true
        createAccountButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        logInButton.topAnchor.constraint(equalTo: createAccountButton.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        aboutUsButton.topAnchor.constraint(equalTo: logInButton.safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
        aboutUsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 110).isActive = true
        aboutUsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -110).isActive = true
        aboutUsButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func createAccountAction() {
        print("Create an Account Button Clicked")
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
    @objc func logInAction() {
        print("Log In Button Clicked")
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc func aboutUsButtonAction() {
        print("About Us Button Clicked")
        showSafariVC(for: "https://github.com/aidinahmadian")
        }
        
        func showSafariVC(for url: String) {
            guard let url = URL(string: url) else {
                return
            }
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
}
