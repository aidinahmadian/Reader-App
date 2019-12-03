//
//  HomeViewController.swift
//  Sign Up-Sign in
//
//  Created by aidin ahmadian on 12/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit
import SafariServices

class HomeViewController: UIViewController {
    
    
// MARK: Creating (UILabels / UITextViews / UIImageViews / UIButtons) Programmatically For our HomeViewController
    
    
    let viewTitle: UILabel = {
       let vt = UILabel()
        vt.translatesAutoresizingMaskIntoConstraints = false
        vt.text = "Reader"
        vt.textColor = .black
        vt.font = UIFont.boldSystemFont(ofSize: 28)
        return vt
    }()
    
    let nameLabel: UILabel = {
       let nl = UILabel()
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.text = "John\nLee Dumas"
        nl.textColor = .black
        nl.numberOfLines = 0
        nl.font = UIFont.boldSystemFont(ofSize: 33)
        return nl
    }()
    
    let verifiedLabel: UILabel = {
       let vl = UILabel()
        vl.translatesAutoresizingMaskIntoConstraints = false
        vl.text = "Verified Blogger"
        vl.textColor = .black
        vl.font = UIFont.boldSystemFont(ofSize: 20)
        return vl
    }()
    
    let approvalImage: UIImageView = {
      let ai = UIImageView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.image = UIImage.init(named: "approval")
        return ai
    }()
    
    let followersLabel: UILabel = {
        let fl = UILabel()
        fl.translatesAutoresizingMaskIntoConstraints = false
        fl.text = "Followers"
        fl.textColor = .gray
        fl.font = UIFont.boldSystemFont(ofSize: 18)
        return fl
    }()
    
    let numberOfFollwers: UILabel = {
        let nof = UILabel()
        nof.translatesAutoresizingMaskIntoConstraints = false
        nof.text = "4.1M"
        nof.font = UIFont.boldSystemFont(ofSize: 18)
        nof.textColor = .black
        return nof
    }()
    
    let followingLabel: UILabel = {
        let fl = UILabel()
        fl.translatesAutoresizingMaskIntoConstraints = false
        fl.text = "Following"
        fl.textColor = .gray
        fl.font = UIFont.boldSystemFont(ofSize: 18)
        return fl
    }()
    
    let numberOfFollowing: UILabel = {
        let nof = UILabel()
        nof.translatesAutoresizingMaskIntoConstraints = false
        nof.text = "10"
        nof.font = UIFont.boldSystemFont(ofSize: 18)
        nof.textColor = .black
        return nof
    }()
    
    let blogLabel: UILabel = {
        let bl = UILabel()
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.text = "Blogs"
        bl.textColor = .gray
        bl.font = UIFont.boldSystemFont(ofSize: 18)
        return bl
    }()
    
    let numberOfBlogs: UILabel = {
        let nob = UILabel()
        nob.translatesAutoresizingMaskIntoConstraints = false
        nob.text = "1.8K"
        nob.font = UIFont.boldSystemFont(ofSize: 18)
        nob.textColor = .black
        return nob
    }()
    
    let descriptionLabel: UITextView = {
        let dl = UITextView()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "John started with making podcasts for inspiring new entrepreneurs and now sells his own products, mostly online courses and ebooks. John has produced over 1900 episodes of podcasts where he interviews aspiring and successful entrepreneurs. You can learn a lot about running your own online business in the podcasts.\nJohn is the pioneer of podcasting among entrepreneurs. If you can talk, podcasts can be a fun way to make money online. The advertisement money on podcasts is really good. You can also learn a great deal from the interviews. It’s a win-win tactic. You create your content while you learn from the experts."
        dl.font = UIFont.systemFont(ofSize: 18)
        dl.isScrollEnabled = true
        dl.isEditable = false
        dl.isSelectable =  false
        return dl
    }()
    
    let exploreBlogsButton: UIButton = {
        let ebb = UIButton()
        ebb.translatesAutoresizingMaskIntoConstraints = false
        ebb.setTitle("Explore Blogs", for: .normal)
        ebb.setTitleColor(.black, for: .normal)
        ebb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        ebb.addTarget(self, action: #selector(exploreButtonAction), for: .touchUpInside)
        return ebb
    }()
    
    let textFieldLineView: UILabel = {
       let tflw = UILabel()
        tflw.translatesAutoresizingMaskIntoConstraints = false
        tflw.backgroundColor = .darkGray
        return tflw
    }()
    
    let signOutButton: UIButton = {
       let sob = UIButton()
        sob.translatesAutoresizingMaskIntoConstraints = false
        sob.setTitle("Sign Out", for: .normal)
        sob.setTitleColor(.red, for: .normal)
        sob.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        sob.addTarget(self, action: #selector(signOutButtonAction), for: .touchUpInside)
        return sob
    }()
    
    
//MARK: viewDidLoad Function
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .clear
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "forthbakground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        setupViews()
        setupConstraints()
    }
    
    
//MARK: SetupViews Function
    
    
    func setupViews() {
        view.addSubview(viewTitle)
        view.addSubview(nameLabel)
        view.addSubview(approvalImage)
        view.addSubview(verifiedLabel)
        view.addSubview(followersLabel)
        view.addSubview(numberOfFollwers)
        view.addSubview(followingLabel)
        view.addSubview(numberOfFollowing)
        view.addSubview(blogLabel)
        view.addSubview(numberOfBlogs)
        view.addSubview(descriptionLabel)
        view.addSubview(exploreBlogsButton)
        view.addSubview(textFieldLineView)
        view.addSubview(signOutButton)
    }
    
    
// MARK: Setup Constraints Programmatically Using Anchors
    
    
    func setupConstraints() {
        
        viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        viewTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: viewTitle.topAnchor, constant: 170).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        verifiedLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 90).isActive = true
        verifiedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        approvalImage.topAnchor.constraint(equalTo: verifiedLabel.topAnchor, constant: 3).isActive = true
        approvalImage.leadingAnchor.constraint(equalTo: verifiedLabel.leadingAnchor, constant: 155).isActive = true
        approvalImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        approvalImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        followersLabel.topAnchor.constraint(equalTo: verifiedLabel.topAnchor, constant: 60).isActive = true
        followersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        numberOfFollwers.topAnchor.constraint(equalTo: followersLabel.topAnchor, constant: 30).isActive = true
        numberOfFollwers.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        followingLabel.topAnchor.constraint(equalTo: verifiedLabel.topAnchor, constant: 60).isActive = true
        followingLabel.leadingAnchor.constraint(equalTo: followersLabel.leadingAnchor, constant: 130).isActive = true
    
        numberOfFollowing.topAnchor.constraint(equalTo: followersLabel.topAnchor, constant: 30).isActive = true
        numberOfFollowing.leadingAnchor.constraint(equalTo: numberOfFollwers.leadingAnchor, constant: 130).isActive = true
        
        blogLabel.topAnchor.constraint(equalTo: verifiedLabel.topAnchor, constant: 60).isActive = true
        blogLabel.leadingAnchor.constraint(equalTo: followingLabel.leadingAnchor, constant: 130).isActive = true
        
        numberOfBlogs.topAnchor.constraint(equalTo: followersLabel.topAnchor, constant: 30).isActive = true
        numberOfBlogs.leadingAnchor.constraint(equalTo: numberOfFollowing.leadingAnchor, constant: 130).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: numberOfFollwers.topAnchor, constant: 50).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: exploreBlogsButton.topAnchor, constant: -10).isActive = true
        
        exploreBlogsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
        exploreBlogsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        
        textFieldLineView.topAnchor.constraint(equalTo: exploreBlogsButton.topAnchor, constant: 35).isActive = true
        textFieldLineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        textFieldLineView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        textFieldLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
        signOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14).isActive = true
    }
    
    @objc func signOutButtonAction() {
        print("Sign Out Button Clicked ⏪")
        let signOutViewController = ViewController()
        navigationController?.pushViewController(signOutViewController, animated: true)
    }
    
    @objc func exploreButtonAction() {
        print("Explore Blogs Button Clicked ⏩")
        showSafariVC(for: "https://www.eofire.com/")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}

