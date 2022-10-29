//
//  ViewController.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 27.10.22.
//

import UIKit
import SDWebImage
class FirstScrn: UIViewController{
    var vm = ViewModel()
    var data: Data?
    var selectBySpecies = false
    var selectByStatus = false
    var selectByName = false
    var selectByGender = false
    
    var nameForSearch: String?
    var typeForSearch: String?
    var speciesForSearch: String?
    var statusForSearch: String?
    var genderForSearch: String?
    @IBAction func darkmodeOnOFF(_ sender: UISwitch) {
        if #available(iOS 13.0, *){
            let delegate = UIApplication.shared.windows.first
            if sender.isOn{
                delegate?.overrideUserInterfaceStyle = .dark
            }else{
                delegate?.overrideUserInterfaceStyle = .light
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setBuindings()
        vm.getList(name: nameForSearch ?? "", status: statusForSearch ?? "", species: speciesForSearch ?? "", type: typeForSearch ?? "", gender: genderForSearch ?? "")
        tableView.reloadData()
    }
    @IBAction func bySpecies(_ sender: UIButton) {
        selectBySpecies = true
        dropdownView.isHidden = true
        selectByStatus = false
        selectByName = false
        selectByGender = false
    }
    @IBAction func byGender(_ sender: UIButton) {
        selectByGender = true
        selectBySpecies = false
        selectByStatus = false
        selectByName = false
        dropdownView.isHidden = true
    }
    @IBAction func byStatus(_ sender: UIButton) {
        selectByStatus = true
        selectBySpecies = false
        selectByName = false
        selectByGender = false
        dropdownView.isHidden = true
    }
    @IBAction func byName(_ sender: UIButton) {
        selectByName = true
        selectBySpecies = false
        selectByStatus = false
        selectByGender = false
        dropdownView.isHidden = true
    }
    @IBAction func filterSearch(_ sender: UIButton) {
        dropdownView.isHidden = false
    }
    @IBOutlet weak var searchField: UITextField!{
        didSet{
            searchField.returnKeyType = UIReturnKeyType.done
            searchField.delegate = self
            searchField.autocorrectionType = .no
        }
    }
    @IBOutlet weak var dropdownView: UIView!{
        didSet{
            dropdownView.layer.cornerRadius = 20
            dropdownView.isHidden = true
        }
    }
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
}

extension FirstScrn: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfFirstScrn", for: indexPath) as! CellOfFirstScrn
        cell.selectionStyle = .none
        cell.genderStatusSpecies.text = "\(data?.results?[safe: indexPath.row]?.status ?? "")-\(data?.results?[safe: indexPath.row]?.species ?? "" )-\(data?.results?[safe: indexPath.row]?.gender ?? "")"
        cell.name.text = data?.results?[safe: indexPath.row]?.name ?? ""
        cell.type.text = data?.results?[safe: indexPath.row]?.type ?? ""
        cell.originCharacter.text = data?.results?[safe: indexPath.row]?.origin?.name ?? ""
        cell.avatarImage.sd_setImage(with: URL(string: data?.results?[safe: indexPath.row]?.image ?? ""))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondScrnVC") as! SecondScrnVC
        self.navigationController?.pushViewController(vc, animated: true)
        vc.data = data?.results?[indexPath.row]
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (data?.results?.count ?? 0) - 1{
            vm.getListPaignation(name: nameForSearch ?? "", status: statusForSearch ?? "", species: speciesForSearch ?? "", type: typeForSearch ?? "", gender: genderForSearch ?? "")
            tableView.reloadData()
        }
    }
}
extension FirstScrn{
    func setBuindings(){
        vm.success = { [weak self] next, data in
            guard let self = self else {return}
            if next == true{
                let prevList = self.data?.results
                self.data?.results = (prevList ?? []) + (data?.results ?? [])
            }else{
                self.data = data
            }
            DispatchQueue.main.async {
                print("data\(data)")
                self.tableView.reloadData()
            }
            print(data)
        }
    }
}
extension FirstScrn: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text{
            if text != ""{
                if selectByName == true{
                    nameForSearch = text
                }else if selectByStatus == true{
                    statusForSearch = text
                }else if selectByGender == true{
                    genderForSearch = text
                }else if selectBySpecies == true{
                    speciesForSearch = text
                }else{
                    nameForSearch = text
                }
                vm.getList(name: nameForSearch ?? "", status: statusForSearch ?? "", species: speciesForSearch ?? "", type: typeForSearch ?? "", gender: genderForSearch ?? "")
            }else{
                vm.getList(name: "", status: "", species: "", type: "", gender: "")
            }
        }
        tableView.reloadData()
    }
}
