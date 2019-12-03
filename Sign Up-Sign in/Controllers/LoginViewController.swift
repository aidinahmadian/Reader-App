//
//  LoginViewController.swift
//  Sign Up-Sign in
//
//  Created by aidin ahmadian on 12/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    

// MARK: Creating (UILabels / UITextFields / UIButtons) Programmatically For our LoginViewController
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let mailTf: UITextField = {
       let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Phone number, username, or email",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        tf.setLeftPaddingPoints(20)
        tf.textAlignment = .left
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.9802859426, green: 0.9804533124, blue: 0.9802753329, alpha: 1)
        tf.setLeftPaddingPoints(20)
        tf.textAlignment = .left
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return button
    }()
    
     lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Register Now"
        label.textColor = #colorLiteral(red: 0.03392242268, green: 0.4783753157, blue: 0.9995169044, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(signUpAction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelTapped)
        return label
    }()
    
    let twitterButton: UIButton = {
       let tb = UIButton()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.setImage(UIImage.init(named: "twitter"), for: .normal)
        tb.addTarget(self, action: #selector(twitterButtonAction), for: .touchUpInside)
        tb.imageView?.contentMode = .scaleAspectFill
        tb.clipsToBounds = true
        return tb
    }()
    
    let instagramButton: UIButton = {
       let ib = UIButton()
        ib.translatesAutoresizingMaskIntoConstraints = false
        ib.setImage(UIImage.init(named: "instagram"), for: .normal)
        ib.addTarget(self, action: #selector(instagramButtonAction), for: .touchUpInside)
        return ib
    }()
    
    let githubButton: UIButton = {
       let gb = UIButton()
        gb.translatesAutoresizingMaskIntoConstraints = false
        gb.setImage(UIImage.init(named: "github"), for: .normal)
        gb.addTarget(self, action: #selector(githubButtonAction), for: .touchUpInside)
        return gb
    }()
    
    
//MARK: viewDidLoad Function
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "sixthbackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        setupView()
        setupConstraints()
    }
    
    @objc func signInAction() {
        print("Sign In Button Clicked")
    let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @objc func signUpAction() {
        print("Sign Up Button Clicked")
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    
    
//MARK: Twitter/Instagram/GitHub Links
    
    
    @objc func twitterButtonAction() {
        print("Twitter Button Clicked")
        showSafariVC(for: "https://twitter.com/Corrrky")
    }
    
    @objc func instagramButtonAction() {
        print("Instagram Button Clicked")
        showSafariVC(for: "https://www.instagram.com/aidinahmadian/")
    }
    
    @objc func githubButtonAction() {
        print("GitHub Button Clicked")
        showSafariVC(for: "https://github.com/aidinahmadian")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    
//MARK: SetupViews Function
    
        
    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(twitterButton)
        view.addSubview(instagramButton)
        view.addSubview(githubButton)
        view.addSubview(titleLabel)
        view.addSubview(mailTf)
        view.addSubview(passwordTf)
        view.addSubview(signInButton)
        view.addSubview(signUpLabel)
    }
    
// MARK: Setup Constraints Programmatically Using NSLayoutConstraint
    
    func setupConstraints() {
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[v0(45)]-60-[v1(44)]-20-[v3(44)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":titleLabel,"v1" : mailTf,"v3":passwordTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":mailTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":passwordTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[v0]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":signInButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(55)]-25-[v2(35)]-25-[v3(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : signInButton,"v2": signUpLabel, "v3":twitterButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":signUpLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":instagramButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(30)]-40-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":githubButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-120-[v0(30)]-20-[v1(30)]-20-[v2(30)]-120-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":twitterButton, "v1":instagramButton, "v2":githubButton]))
    }
}

