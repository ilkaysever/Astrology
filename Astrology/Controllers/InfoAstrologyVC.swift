//
//  InfoAstrologyVC.swift
//  Astrology
//
//  Created by ilkay on 26.10.2020.
//

import UIKit

class InfoAstrologyVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var data: AstrologyModel!
    var astroList: [String] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        convertArrayList()
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func convertArrayList() {
        let astroList: [String] = [data.ascendant, data.Varna, data.Vashya, data.Yoni, data.Gan, data.Nadi, data.SignLord, data.sign, data.Naksahtra, data.NaksahtraLord, String(data.Charan), data.Yog, data.Karan, data.Tithi, data.yunja, data.tatva, data.name_alphabet, data.paya]
        self.astroList = astroList
    }
    
}

extension InfoAstrologyVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return astroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.astroList[indexPath.row]
        return cell
    }
    
}
