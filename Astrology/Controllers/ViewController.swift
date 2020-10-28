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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func getRequest() {
        let model = AstrologyRequestModel(day: Int(dayTextField.text!)!, month: Int(monthTextField.text!)!, year: Int(yearTextField.text!)!, hour: Int(hourTextField.text!)!, min: Int(minTextField.text!)!, lat: Float(latTextField.text!)!, lon: Float(lonTextField.text!))
        Services.getAstroDetail(model: model) { (astromodel) in
            self.showSecondController(model: astromodel)
            print(astromodel)
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
    
    func showSecondController(model: AstrologyModel!) {
        let storyboard = UIStoryboard(name: "InfoAstrology", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "InfoAstrologyVC") as! InfoAstrologyVC
        nextVC.data = model
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func nextButtonTpped(_ sender: Any) {
        getRequest()
    }
    
}

