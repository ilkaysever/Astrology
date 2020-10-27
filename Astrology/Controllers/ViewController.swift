//
//  ViewController.swift
//  Astrology
//
//  Created by ilkay on 26.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var infoContainerView: UIView!
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minTextField: UITextField!
    
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lonTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        getRequest()
    }
    
    func getRequest() {
        Services.getAstroDetail { (response) in
            print(response)
        } error: { (error) in
            print(error)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setViews() {
        infoContainerView.layer.cornerRadius = 30.0
        infoContainerView.layer.shadowColor = UIColor.black.cgColor
        infoContainerView.layer.shadowOffset = .zero
        infoContainerView.layer.shadowOpacity = 1
        infoContainerView.backgroundColor = UIColor.white
        
        nextButton.layer.cornerRadius = 8
    }
    
    @IBAction func nextButtonTpped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "InfoAstrology", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "InfoAstrologyVC") as! InfoAstrologyVC
        //nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
}

