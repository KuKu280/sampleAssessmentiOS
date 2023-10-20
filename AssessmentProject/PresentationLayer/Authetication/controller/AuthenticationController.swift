//
//  AuthenticationController.swift
//  AssessmentProject
//
//  Created by Ku Ku Zan on 10/19/23.
//

import UIKit

class AuthenticationController: UIViewController {
    
    @IBOutlet
    private var phoneBarView: UIView!
    @IBOutlet
    private var phoneTFView: UIView!
    @IBOutlet
    private var emailBarView: UIView!
    @IBOutlet
    private var emailTFView: UIView!
    
    
    @IBOutlet
    private var phoneButton: UIButton!
    @IBOutlet
    private var emailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        render(flag: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func render(flag: Bool) {
        if flag == true {
            showPhoneUI()
            hideEmailUI()
        } else {
            hidePhoneUI()
            showEmailUI()
        }
    }
    
    private func hidePhoneUI() {
        phoneBarView.isHidden = true
        phoneButton.setTitleColor(UIColor.Assessment.gray, for: .normal)
        phoneTFView.isHidden = true
    }
    
    private func showPhoneUI() {
        phoneBarView.isHidden = false
        phoneButton.setTitleColor(.white, for: .normal)
        phoneTFView.isHidden = false
    }
    
    private func hideEmailUI() {
        emailBarView.isHidden = true
        emailButton.setTitleColor(UIColor.Assessment.gray, for: .normal)
        emailTFView.isHidden = true
    }
    
    private func showEmailUI() {
        emailBarView.isHidden = false
        emailButton.setTitleColor(.white, for: .normal)
        emailTFView.isHidden = false
    }
    

    @IBAction
    private func didTapPhone(_ sender: UIButton) {
       render(flag: true)
    }
    
    @IBAction func didTapEmail(_ sender: UIButton) {
       render(flag: false)
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        let tabBarVC = MainTabBarController()
        navigationController?.pushViewController(tabBarVC, animated: true)
    }

}
