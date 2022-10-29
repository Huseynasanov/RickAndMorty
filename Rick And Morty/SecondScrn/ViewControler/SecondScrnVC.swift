//
//  SecondScrnVC.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 28.10.22.
//

import UIKit
import SDWebImage
class SecondScrnVC: UIViewController {
    var data: Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.sd_setImage(with: URL(string: data?.image ?? "" ))
        name.text = data?.name ?? ""
        type.text = "Type: \(data?.type ?? "unknow")"
        location.text = "Location: \(data?.location?.name ?? "")"
        species.text = "Species: \(data?.species ?? "")"
        gender.text = "Gender: \(data?.gender ?? "")"
        originCharacter.text = "Origin of a character: \(data?.origin?.name ?? "")"
        status.text = "Status: \(data?.status ?? "")"
        descriptionView.layer.cornerRadius = 20
    }
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var originCharacter: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
}
